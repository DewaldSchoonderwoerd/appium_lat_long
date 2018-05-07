def set_current_location(location)
	@current_latitude = location[:latitude]
	@current_longitude = location[:longitude]
	@current_name = location[:name]
end

def current_location
 {
		altitude: 75.0,
		latitude: @current_latitude,
		longitude: @current_longitude,
		name: @current_name
	}
end