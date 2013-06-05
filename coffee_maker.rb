class CoffeeMaker

	def initialize (water_limit, coffee_limit)
		@water_limit = water_limit.to_i
		@water_current = 0
		@coffee_limit = coffee_limit.to_i
		@coffee_current = 0
		@number_of_cups = 0
		@cups_since_clean = 0
		@number_of_water_err = 0
		@number_of_coffee_err = 0
		@number_of_water_refills = 0
		@number_of_water_refill_err = 0
		@number_of_coffee_refills = 0
		@number_of_coffee_refill_err = 0
	end

	def info
		puts "Coffee:  #{@coffee_current}/#{@coffee_limit}"
		puts "Water:   #{@water_current}/#{@water_limit}"
		puts "Cups:    #{@number_of_cups}"
		puts "Clean in #{12 - @cups_since_clean} cups"
	end

	def fill_water(ml)
		ml_in = ml.to_i
		if @water_current + ml_in > @water_limit
			@number_of_water_refill_err += 1
			puts "That ist too much water (max: #{@water_limit - @water_current})"
		else
			puts "Changing water level from #{@water_current} to #{@water_current+ml_in}"
			@water_current += ml_in
			@number_of_water_refills += 1
		end
	end


	def fill_coffee(g)
		g_in = g.to_i
		if @coffee_current + g_in > @coffee_limit
			@number_of_coffee_refill_err += 1
			puts "That ist too much coffee (max: #{@coffee_limit - @coffee_current})"
		else
			puts "Changing coffee level from #{@coffee_current} to #{@coffee_current+g_in}"
			@coffee_current += g_in
			@number_of_coffee_refills += 1
		end
	end

	def make_cup
		if @cups_since_clean <= 11
			if @water_current < 150
				@number_of_water_err += 1	
				puts "Sorry, not enough water. Please fill."
				return
			end
			if @coffee_current < 8
				@number_of_coffee_err += 1
				puts "Sorry, not enough coffee. Please fill."
				return
			end
			puts "Here is your cup of coffee, enjoy."
			@water_current -= 150
			@coffee_current -= 8
			@number_of_cups += 1
			@cups_since_clean += 1
			if @cups_since_clean == 12
				puts "Machine will need clean before next cup. Please consider cleaning now."
			end
		else
			puts "Please clean the machine first."
		end
	end

	def clean_machine
		puts "Thank you."
		@cups_since_clean = 0
	end

	def err_info
		puts "Water Errors:        #{@number_of_water_err}"
		puts "Water Refills:       #{@number_of_water_refills}"
		puts "Water Refill Errors: #{@number_of_water_refill_err}"
		puts "Coffee Errors:        #{@number_of_coffee_err}"
		puts "Coffee Refills:       #{@number_of_coffee_refills}"
		puts "Coffee Refill Errors: #{@number_of_coffee_refill_err}"
	end

end
