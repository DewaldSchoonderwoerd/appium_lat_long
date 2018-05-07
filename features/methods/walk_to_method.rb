def walk_to(from_location, to_location, speed = "pacy")
	speed = set_speed(speed) 
	hit_hash = {
		longitude_bigger: "Not Hit",
		latitude_bigger: "Not Hit",
		latitude_smaller: "Not Hit",
		longitude_smaller: "Not Hit"
	}
	
	if is_longitude_bigger(from_location, to_location)
		hit_hash[:longitude_bigger] = "hit"
	end
	
	if is_longitude_smaller(from_location, to_location)
		hit_hash[:longitude_smaller] = "hit"
	end
	
	if is_latitude_smaller(from_location, to_location)
		hit_hash[:latitude_smaller] = "hit"
	end
	
	if is_latitude_bigger(from_location, to_location)
		hit_hash[:latitude_bigger] = "hit"
	end
	
	until check_location(from_location, to_location, hit_hash)
		condition_step(from_location, to_location, hit_hash, speed)
	end
	
	set_location(latitude: to_location[:latitude], longitude: to_location[:longitude])
	
	p "Current location is #{to_location[:name]}: latitude #{to_location[:latitude]}, longitude: #{to_location[:longitude]}"
	p "refresh_location"
	
	set_current_location(to_location)
end

def is_latitude_bigger(from_location, to_location)
	if from_location[:latitude] > to_location[:latitude]
		return true
	else
		return false	
	end
end

def is_latitude_smaller(from_location, to_location)
	if from_location[:latitude] < to_location[:latitude]
		return true
	else
		return false	
	end
end

def is_longitude_bigger(from_location, to_location)
	if from_location[:longitude] > to_location[:longitude]
		return true
	else
		return false	
	end
end

def is_longitude_smaller(from_location, to_location)
	if from_location[:longitude] < to_location[:longitude]
		return true
	else
		return false	
	end
end

def step_latitude_negative(from_location, to_location, speed)
	set_location(latitude:  from_location[:latitude] -= speed, longitude:  from_location[:longitude])
	sleep 2
	diff = from_location[:latitude] - to_location[:latitude]
	p "Steped latitude negative, from latitude: #{from_location[:latitude]} , to latitude: #{to_location[:latitude]}, difference: #{diff}"
end

def step_latitude_positive(from_location, to_location, speed)
	set_location(latitude:  from_location[:latitude] += speed, longitude:  from_location[:longitude])
	sleep 2
	diff = from_location[:latitude] - to_location[:latitude]
	p "Steped latitude positive, from latitude: #{from_location[:latitude]}, to latitude: #{to_location[:latitude]}, difference: #{diff}"
end

def step_longitude_positive(from_location, to_location, speed)
	set_location(latitude:  from_location[:latitude] ,longitude:  from_location[:longitude] += speed)
	sleep 2
	diff = from_location[:longitude] - to_location[:longitude]
	p "Steped longitude negative, from longitude: #{from_location[:longitude]}, to longitude: #{to_location[:longitude]}, difference: #{diff}"
end

def step_longitude_negative(from_location, to_location, speed)
	set_location(latitude:  from_location[:latitude], longitude:  from_location[:longitude] -= speed)
	sleep 2
	diff = from_location[:longitude] - to_location[:longitude]
	p "Steped longitude positive, from longitude: #{from_location[:longitude]}, to longitude: #{to_location[:longitude]}, difference: #{diff}"
end

def set_speed(speed)
	case speed
	when "fast" 
		return 0.0002
	when "pacy"
		return 0.0001
	when "slow"
		return 0.00005
	else
		raise "Not a valid speed entry accepted options are 'fast', 'pacy' and 'slow'. **NOTE: speed is set by default to pacy**"
	end
end

def check_location(from_location, to_location, hit_hash)
	if hit_hash[:longitude_bigger] == "hit"
		if is_longitude_smaller(from_location, to_location)
			return true
		end
	end
	
	if hit_hash[:latitude_bigger] == "hit"
		if is_latitude_smaller(from_location, to_location)
			return true
		end
	end
	
	if hit_hash[:latitude_smaller] == "hit"
		if is_latitude_bigger(from_location, to_location)
			return true
		end
	end
	
	if hit_hash[:longitude_smaller] == "hit"
		if is_longitude_bigger(from_location, to_location)
			return true
		end
	end
end

def condition_step(from_location, to_location, hit_hash, speed)
	if hit_hash[:longitude_bigger] == "hit"
		step_longitude_negative(from_location, to_location, speed)
	end
	
	if hit_hash[:latitude_bigger] == "hit"
		step_latitude_negative(from_location, to_location, speed)
	end
	
	if hit_hash[:latitude_smaller] == "hit"
		step_latitude_positive(from_location, to_location, speed)
	end
	
	if hit_hash[:longitude_smaller] == "hit"
		step_longitude_positive(from_location, to_location, speed)
	end
end