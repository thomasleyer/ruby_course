#!/usr/bin/env ruby

def frame(content = "")
	content = yield if block_given?
	border = "-" * (content.size+4)
	puts border
	puts "| #{content} |"
	puts border
end

frame ("hallo")
frame ( "zufall#{rand(1009)}")
