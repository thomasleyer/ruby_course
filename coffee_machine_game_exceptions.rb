#!/usr/bin/env ruby

require "./coffee_maker_exceptions"

def info
	Coffee1.info
end

def fill_coffee
	amount = 1 + rand(50)
	puts Coffee1.fill_coffee(amount)
end


def fill_water
	amount = 1 + rand(1500)
	puts Coffee1.fill_water(amount)
end

def clean
	puts Coffee1.clean_machine
end

def make_cup
	begin
		puts Coffee1.make_cup
	rescue NotEnoughCoffee
		puts "Filling coffee."
		puts fill_coffee
	rescue NotEnoughWater
		puts "Filling water."
		puts fill_water
	rescue MachineNeedsCleaning
		puts "Cleaning machine."
		puts clean
	rescue MachineWillNeedCleaning
		puts "Proactively cleaning machine."
		puts clean
	end
end

def err_info
	puts Coffee1.err_info
end

Coffee1 = CoffeeMaker.new('2000', '150')

while true

	random_action = 1 + rand(50)
	case random_action
		when 1
			info
		when 2..10
			fill_water
		when 11..20
			fill_coffee
		when 21..25
			clean
		when 26..49
			make_cup
		when 50
			stop_num = rand(1000)
			if stop_num == 1
				puts "------------------------  statistics --------------------------"
				puts info
				puts err_info
				break
			end
	end
end

