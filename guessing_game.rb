#!/usr/bin/env ruby

DIMENSION = 100
NUM_TO_GUESS = 1 + rand(DIMENSION)

guessed = false
guesses = 1

puts "Welcome to our guessing game."
puts "I will randomly choose a number between 1 and #{DIMENSION}, which you will then try to guess."

while guessed == false do
	print "Please enter your guess no #{guesses}: "
	guess = gets.chop.to_i

	if guess > DIMENSION
		puts "You may want to give a number smaller than #{DIMENSION}"
		redo
	end

	if guess < 1
		puts "You may want to give a number bigger than 1"
		redo
	end

	if guess == NUM_TO_GUESS
		puts "Eureka, you found it in #{guesses} guesses"
		guessed = true
	elsif guess < NUM_TO_GUESS
		puts "No, your number is too small."
	elsif guess > NUM_TO_GUESS
		puts "No, your number is too big."
	end
	guesses += 1
end 
