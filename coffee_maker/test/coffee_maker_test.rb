#!/usr/bin/env ruby

require "test_helper"
require "coffee_maker"

class CoffeeMakerTest < MiniTest::Unit::TestCase
	def setup
		@machine = CoffeeMaker::CoffeeMaker.new(2000,150)
	end

	def setup_fill_machine
		@machine.fill_coffee(150)
		@machine.fill_water(2000)
	end

	def test_filling_too_much_coffee
		assert_raises(CoffeeMaker::FilledTooMuchCoffee) { @machine.fill_coffee(151) }
	end

	def test_filling_too_much_water
		assert_raises CoffeeMaker::FilledTooMuchWater do 
			@machine.fill_water(2001)
		end
	end

  def test_make_cup_from_empty_coffee
    assert_raises CoffeeMaker::NotEnoughCoffee do
      @machine.fill_water(150)
			@machine.make_cup
    end
  end

	def test_make_cup_from_empty_water
		assert_raises CoffeeMaker::NotEnoughWater do
			@machine.fill_coffee(8)
			@machine.make_cup
		end
	end

	def test_make_coffee_until_needs_cleaning
		assert_raises CoffeeMaker::MachineNeedsCleaning do
			setup_fill_machine
			13.times do
				begin 
					@machine.make_cup
				rescue CoffeeMaker::MachineWillNeedCleaning
				end
			end
		end
	end

	def test_make_coffee_until_will_need_cleaning
		assert_raises CoffeeMaker::MachineWillNeedCleaning do
			setup_fill_machine
			12.times { @machine.make_cup }
		end
	end

	def test_machine_constructor
		assert_instance_of CoffeeMaker::CoffeeMaker, @machine 
	end

	def test_adding_water
		assert_match /Water:   0\//, @machine.info
		@machine.fill_water(1000)
		assert_match /Water:   1000\//, @machine.info
	end

	def test_adding_coffee
		assert_match /Coffee:  0\//, @machine.info
		@machine.fill_coffee(100)
		assert_match /Coffee:  100\//, @machine.info
	end

	def test_new_machine_can_make_cup
		@machine.fill_water ( 150 )
		@machine.fill_coffee ( 8 )
		assert_equal "Here is your cup of coffee, enjoy.\n", @machine.make_cup
	end

	def test_water_limit
		@machine.fill_water (149)
		@machine.fill_coffee (8)
		assert_raises CoffeeMaker::NotEnoughWater do
			@machine.make_cup
		end
	end

	def test_coffee_limit
		@machine.fill_water (150)
		@machine.fill_coffee (7)
		assert_raises CoffeeMaker::NotEnoughCoffee do
			@machine.make_cup
		end
	end

	def test_machine_uses_right_amount_of_water_and_coffee
		setup_fill_machine
		@machine.make_cup
		assert_match /Water:   1850\//, @machine.info
		assert_match /Coffee:  142\//, @machine.info
	end

	def test_cleaning_machine
		setup_fill_machine
		5.times { @machine.make_cup }
		assert_match /Clean in 7 cups/, @machine.info
		assert_match /Thank you./, @machine.clean_machine
	end

	def test_debug_output
		assert_match /Water Errors:        0/, @machine.err_info
		@machine.fill_coffee(8)
		assert_raises(CoffeeMaker::NotEnoughWater) do
			@machine.make_cup
		end
		assert_match /Water Errors:        1/, @machine.err_info
	end

end
