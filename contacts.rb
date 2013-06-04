#!/usr/bin/env ruby
#
# contacts.rb 
#
# Very simple in memory contact database
#

contacts = []

def menue
  puts "Menue"
  puts " N... new contact"
  puts " L... list contacts (in short form)"
  puts " index_number ... show contact #index_number"
  puts " X... exit"
end

def line
	puts "---------------------------------------------------------------------"
end

def new
	h = {}
	line
	puts "Please your new contact: "
	print "name:   "
	h[:name] = gets.chomp
	print "street: "
	h[:street] = gets.chomp
	print "city:   "
	h[:city] = gets.chomp
	return h
	line
end

def list(contacts= [])
	line
	contacts.each_with_index do |element,i| 
		puts "#{i}. #{element[:name]}"
	end
	line
end

def show_index_number(input: 0, contacts: [])
	line
  if input.to_i.to_s == input
    index = input.to_i
		if ( index >= contacts.size || index < 0 )
			case contacts.size
				when 0
					puts "Sorry, empty contact list."
				when 1
					puts "Non-existing index (0 only)."
				else
					puts "Non-existing index (between 0 and #{contacts.size - 1})"
			end
			return
		else
    	puts "Entry #{index}"
    	element =  contacts[index]
    	puts "index: #{index}"
    	puts "name: #{element[:name]}"
		end
  end
end

## Main 
puts "Contacts"
puts "extremely simple database for storing addresses in memory."
line

## Loop until user enters x/X for exit
while (true)
	menue
	input = gets.chop
	case input
		when "x","X"
			break
		when "n","N"	
			contacts.push(new) #retrieve new contact information and push into array
		when "l", "L"
			list(contacts) #list contacts 
		else
			show_index_number(input: input,contacts: contacts) 
	end
	line
end
