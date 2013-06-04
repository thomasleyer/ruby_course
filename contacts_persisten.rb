#!/usr/bin/env ruby
#
# contacts.rb 
#
# Very simple in memory contact database
#

DATABASE_FILE = "contacts.csv"

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
	if ( h[:name] =~ /;/ || h[:street] =~ /;/ || h[:city] =~ /;/ )
		h = nil 
  else
		File.open(DATABASE_FILE, "a") do |file|	
			file.puts ("#{h[:name]};#{h[:street]};#{h[:city]};")
		end
		puts "New contact successfully saved."
	end
	return h
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
puts "extremely simple database for storing addresses file #{DATABASE_FILE}."
line

## read existing contacts database
if File.exists?(DATABASE_FILE)
	File.open(DATABASE_FILE, "r") do |file|
		file.each_line do |line|
			l = line.split(";")
			if l.size > 4
				abort "Database file #{DATABASE_FILE} inconsistent!"
			end
			h = {}
 			h[:name] = l[0]
  		h[:street] = l[1]
  		h[:city] = l[2]
			contacts.push(h)
		end
	end
else
	puts "No database found."
end

## Loop until user enters x/X for exit
while (true)
	menue
	input = gets.chop
	case input
		when "x","X"
			break
		when "n","N"	
			## new will return nil if an invalid input was provided
			new_contact = new
			if new_contact
				contacts.push(new_contact) #retrieve new contact information and push into array
			end
		when "l", "L"
			list(contacts) #list contacts 
		else
			show_index_number(input: input,contacts: contacts) 
	end
	line
end
