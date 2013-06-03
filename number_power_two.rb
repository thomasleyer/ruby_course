#!/usr/bin/env ruby

def num_power_two(number: 0)
	return ( number * number )
end

print "Please enter a number: "
number = gets.chop

if number.to_i.to_s == number.to_s
	puts num_power_two(number: (number.to_i))
elsif number.to_f.to_s == number.to_s
	puts num_power_two(number: number.to_f)
else
	puts "Cannot work with non-numbers"
end
