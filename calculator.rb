#!/usr/bin/env ruby

def add(number1: 0, number2: 0)
	return (number1 + number2)
end

def substract(number1: 0, number2: 0)
	return (number1 - number2)
end

def divide(number1: 0, number2: 1)
	if number2 == 0
		abort "Division by zero"
	end
	return (number1 / number2)
end

def multiply(number1: 1, number2: 1)
	return (number1 * number2)
end

def is_string_number?(number_string: "")
	if number_string.to_i.to_s == number_string.to_s 
  	output =  number_string.to_i
	elsif number_string.to_f.to_s == number_string.to_s 
	  output = number_string.to_f
	else
	  abort "Need an integer or float as input."
	end
	return output
end

def operand_case(operand: "")
	abort "Need a mathematical operand" if not (["+","-","*","/"].include?(operand))
	operand_method = case operand
		when "+"
 			:add
 		when "-"
 	    :substract
 	 	when "/"
 	 	  :divide
 	  when "*"
 	  	:multiply
		end
	return operand_method
end


print "Please enter 1st number: "
string_number1 = gets.chop
number1 = is_string_number?(number_string: string_number1)

print "Please enter operand: "
operand = gets.chop
send_to = operand_case(operand: operand)

print "Please enter 2nd number: "
string_number2 = gets.chop
number2 = is_string_number?(number_string: string_number2)

puts ( send(send_to,number1: number1, number2: number2))
