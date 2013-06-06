#!/usr/bin/env ruby

require "minitest/autorun"
require "./coffee_maker_exceptions.rb"
require "turn"

class CoffeeMakerTest < MiniTest::Unit::TestCase
	def setup
		@machine = CoffeeMaker.new(2000,150)
	end

	def setup_fill_machine
		@machine.fill_coffee(150)
		@machine.fill_water(2000)
	end

	def test_filling_too_much_coffee
		assert_raises(FilledTooMuchCoffee) { @machine.fill_coffee(10000) }
	end

	def test_filling_too_much_water
		assert_raises FilledTooMuchWater do 
			@machine.fill_water(10000)
		end
	end

  def test_make_cup_from_empty_coffee
    assert_raises NotEnoughCoffee do
      @machine.fill_water(150)
			@machine.make_cup
    end
  end

	def test_make_cup_from_empty_water
		assert_raises NotEnoughWater do
			@machine.fill_coffee(8)
			@machine.make_cup
		end
	end

	def test_make_coffee_until_needs_cleaning
		assert_raises MachineNeedsCleaning do
			setup_fill_machine
			13.times do
				begin 
					@machine.make_cup
				rescue MachineWillNeedCleaning
				end
			end
		end
	end

	def test_make_coffee_until_will_need_cleaning
		assert_raises MachineWillNeedCleaning do
			setup_fill_machine
			12.times { @machine.make_cup }
		end
	end

	def test_machine_constructor
		assert_instance_of CoffeeMaker, @machine 
	end

end
