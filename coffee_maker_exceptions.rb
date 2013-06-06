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
		output = "Coffee:  #{@coffee_current}/#{@coffee_limit}\n"
		output << "Water:   #{@water_current}/#{@water_limit}\n"
		output << "Cups:    #{@number_of_cups}\n"
		output << "Clean in #{12 - @cups_since_clean} cups\n"
		return output
	end

	def fill_water(ml)
		ml_in = ml.to_i
		if @water_current + ml_in > @water_limit
			@number_of_water_refill_err += 1
			raise FilledTooMuchWater
			output = "That ist too much water (max: #{@water_limit - @water_current})\n"
		else
			output = "Changing water level from #{@water_current} to #{@water_current+ml_in}\n"
			@water_current += ml_in
			@number_of_water_refills += 1
		end
		return output
	end


	def fill_coffee(g)
		g_in = g.to_i
		if @coffee_current + g_in > @coffee_limit
			@number_of_coffee_refill_err += 1
			raise FilledTooMuchCoffee
			output = "That ist too much coffee (max: #{@coffee_limit - @coffee_current})\n"
		else
			output = "Changing coffee level from #{@coffee_current} to #{@coffee_current+g_in}\n"
			@coffee_current += g_in
			@number_of_coffee_refills += 1
		end
		return output
	end

	def make_cup
		output = ""
		if @cups_since_clean <= 11
			if @water_current < 150
				@number_of_water_err += 1	
				raise NotEnoughWater
				return output
			end
			if @coffee_current < 8
				@number_of_coffee_err += 1
				raise NotEnoughCoffee
				return output
			end
			output = "Here is your cup of coffee, enjoy.\n"
			@water_current -= 150
			@coffee_current -= 8
			@number_of_cups += 1
			@cups_since_clean += 1
			if @cups_since_clean == 12
				raise MachineWillNeedCleaning
			end
		else
			raise MachineNeedsCleaning
		end
		return output
	end

	def clean_machine
		output = "Thank you."
		@cups_since_clean = 0
		return output
	end

	def err_info
		output = "Water Errors:        #{@number_of_water_err}\n"
		output << "Water Refills:       #{@number_of_water_refills}\n"
		output << "Water Refill Errors: #{@number_of_water_refill_err}\n"
	  output << "Coffee Errors:        #{@number_of_coffee_err}\n"
		output << "Coffee Refills:       #{@number_of_coffee_refills}\n"
		output << "Coffee Refill Errors: #{@number_of_coffee_refill_err}\n"
	end

end

class NotEnoughWater < Exception
	def to_s
		"Not enough water"
	end
end

class NotEnoughCoffee < Exception
  def to_s
    "Not enough coffee"
  end
end

class MachineNeedsCleaning < Exception
  def to_s
    "Machine needs cleaning"
  end
end

class MachineWillNeedCleaning < Exception
  def to_s
    "Machine needs cleaning"
  end
end

class FilledTooMuchCoffee < Exception
  def to_s
    "Filled too much coffee"
  end
end


class FilledTooMuchWater < Exception
  def to_s
    "Filled too much water"
  end
end



