#!/usr/bin/env ruby

require "./book"

puts "Number of books: #{Book.number_of_books}"

a = Book.new('Unkenrufe', 'Guenter Grass', '100', '32.50')

puts "Number of books: #{Book.number_of_books}"

b = Book.new('Die Blechtrommel', 'Guenter Grass', '100', '32.50')

puts "Number of books: #{Book.number_of_books}"

puts "Second book is '#{b.title}' by #{b.author} with #{b.pages} and for a price of #{b.price}"

puts "change pages"

b.pages = 700

puts "Second book is '#{b.title}' by #{b.author} with #{b.pages} and for a price of #{b.price}"




