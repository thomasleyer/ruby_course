#!/usr/bin/env ruby

require "./coffee_maker"

Coffee1 = CoffeeMaker.new('2000', '150')

Coffee1.info
Coffee1.fill_coffee(150)
Coffee1.fill_water(2000)
Coffee1.info
Coffee1.fill_coffee(150)
Coffee1.fill_water(1000)
Coffee1.info
12.times {Coffee1.make_cup}
puts "clean"
Coffee1.clean_machine
Coffee1.fill_water('1000')
Coffee1.fill_coffee(96)
6.times {Coffee1.make_cup}
Coffee1.fill_water('1000')



