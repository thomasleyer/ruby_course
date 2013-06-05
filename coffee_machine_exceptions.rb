#!/usr/bin/env ruby

require "./coffee_maker"

puts Coffee1 = CoffeeMaker.new('2000', '150')

puts Coffee1.info
puts Coffee1.fill_coffee(150)
puts Coffee1.fill_water(2000)
puts Coffee1.info
puts Coffee1.fill_coffee(150)
puts Coffee1.fill_water(1000)
puts Coffee1.info
12.times {puts Coffee1.make_cup}
puts "clean"
puts Coffee1.clean_machine
puts Coffee1.fill_water('1000')
puts Coffee1.fill_coffee(96)
6.times {puts Coffee1.make_cup}
puts Coffee1.fill_water('1000')



