def go_to(location, long_walk = false, speed = "pacy")
	if current_location[:latitude] == nil
		raise "Does not have a current location yet please set current location with set_current_location(location_name)"
	elsif current_location[:longitude] == nil
		raise "Does not have a current location yet please set current location with set_current_location(location_name)"
	end
	
	if long_walk == true
		long_walk_to(current_location, location)
	else
		walk_to(current_location, location)
	end
end