def long_walk_to(from_location, to_location, speed)
	speed = set_speed(speed)
	
	p "Taking the longest route"
	
	if long_is_latitude_bigger(from_location, to_location)
		long_step_latitude_negative(from_location, to_location, speed)
	elsif long_is_latitude_smaller(from_location, to_location)
		long_step_latitude_positive(from_location, to_location, speed)
	end
	
	if long_is_longitude_bigger(from_location, to_location)
		long_step_longitude_negative(from_location, to_location, speed)
	elsif long_is_longitude_smaller(from_location, to_location)
		long_step_longitude_positive(from_location, to_location, speed)
	end
	
		p "Current location is #{to_location[:name]}: latitude #{to_location[:latitude]}, longitude: #{to_location[:longitude]}"
		p "refresh_location"
		
		set_current_location(to_location)
end

def long_is_latitude_bigger(from_location, to_location)
	if from_location[:latitude] > to_location[:latitude]
		return true
	else
		return false	
	end
end

def long_is_latitude_smaller(from_location, to_location)
	if from_location[:latitude] < to_location[:latitude]
		return true
	else
		return false	
	end
end

def long_is_longitude_bigger(from_location, to_location)
	if from_location[:longitude] > to_location[:longitude]
		return true
	else
		return false	
	end
end

def long_is_longitude_smaller(from_location, to_location)
	if from_location[:longitude] < to_location[:longitude]
		return true
	else
		return false	
	end
end

def long_step_latitude_negative(from_location, to_location, speed)
	until from_location[:latitude] <= to_location[:latitude]
		set_location(latitude:  from_location[:latitude] -= speed, longitude:  from_location[:longitude])
		sleep 2
		diff = from_location[:latitude] - to_location[:latitude]
		p "Steped latitude negative, from latitude: #{from_location[:latitude]} , to latitude: #{to_location[:latitude]}, difference: #{diff}"
	end
end

def long_step_latitude_positive(from_location, to_location, speed)
	until from_location[:latitude] >= to_location[:latitude]
		set_location(latitude:  from_location[:latitude] += speed, longitude:  from_location[:longitude])
		sleep 2
		diff = from_location[:latitude] - to_location[:latitude]
		p "Steped latitude positive, from latitude: #{from_location[:latitude]}, to latitude: #{to_location[:latitude]}, difference: #{diff}"
	end
end

def long_step_longitude_positive(from_location, to_location, speed)
	until from_location[:longitude] >= to_location[:longitude]
		set_location(latitude:  from_location[:latitude] ,longitude:  from_location[:longitude] += speed)
		sleep 2
		diff = from_location[:longitude] - to_location[:longitude]
		p "Steped longitude negative, from longitude: #{from_location[:longitude]}, to longitude: #{to_location[:longitude]}, difference: #{diff}"
	end	
end

def long_step_longitude_negative(from_location, to_location, speed)
	until from_location[:longitude] <= to_location[:longitude]
		set_location(latitude:  from_location[:latitude], longitude:  from_location[:longitude] -= speed)
		sleep 2
		diff = from_location[:longitude] - to_location[:longitude]
		p "Steped longitude positive, from longitude: #{from_location[:longitude]}, to longitude: #{to_location[:longitude]}, difference: #{diff}"
	end
end