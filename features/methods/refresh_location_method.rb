	def refresh_location
		set_location(latitude: current_location[:latitude], longitude: current_location[:longitude])
		
		p "Refreshed location on latitude: #{current_location[:latitude]}, longitude: #{current_location[:longitude]}"
	end