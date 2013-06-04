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
	divide_output = number1 / number2
	divide_output_float = number1.to_f / number2.to_f
	
	if ( divide_output == divide_output_float ) 
		return divide_output 
	else
		return divide_output_float
	end
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

statement = ARGV.join(" ")

statement_format = /
										\A					#begin of string
										(?<num1>\-?\d+\.?\d*)				#number1
										\s*					#whitespaces until operator
										(?<operand>[\+\-\*\/])		#operator
										\s*					#whitespaces until second number
										(?<num2>\-?\d+\.?\d*)				#number2
										\Z					#end of string
										/x 

match_statement = statement_format.match(statement)

if ( match_statement == nil ) 
	abort "no valid statement"
end

send_to = operand_case(operand: match_statement[:operand])

number1 = is_string_number?( number_string: match_statement[:num1])
number2 = is_string_number?( number_string: match_statement[:num2])

puts ( send(send_to,number1: number1, number2: number2))
