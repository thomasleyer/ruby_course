#!/usr/bin/env ruby

def welcome_message(name: "")
	return "Hello, #{name}. Good to see you!"
end

print "Please enter a name: "
name = gets.chop

puts welcome_message(name: name);
