class Book
## simple book class
#
# task: write a class representing books
#				attributes(minimum): title, author, pages, price
#       new instance requires all attributes
#       all attributes read and writable
#       class shall count instanciated books
#       number of instanciated books accessible
#

	attr_accessor :title, :author, :pages, :price

	@@number_of_books = 0

	def initialize (title, author, pages, price)
		puts " initializing..."
		@title = title
		@author = author
		@pages = pages
		@price = price
		@@number_of_books += 1
	end
	def self.number_of_books
		@@number_of_books
	end
end
