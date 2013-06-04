#!/usr/bin/env ruby


def menue
  puts "Menue"
  puts " N... new contact"
  puts " L... list contacts (in short form)"
  puts " index_number ... show contact #index_number"
  puts " X... exit"
end

puts "Contacts"
puts "extremely simple database for storing addresses."

while (true)
	menue
	input = gets.chop
	redo if not (["N","n","L","l","X","x"])
	if ( input == "x" or input == "X" ) 
		break
	end
end
