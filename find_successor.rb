#!/usr/bin/env ruby

print "Please enter a number: "
number = gets.chop

if ( number.to_s == number.to_i.to_s )
	puts number.succ
else
	puts "No, really, I meant enter a number!"
end

