	def walk_to(from_location, to_location)
		speed = 0.0001
		
		if from_location[:latitude] > to_location[:latitude]
			until from_location[:latitude] <= to_location[:latitude]
				set_location(latitude:  from_location[:latitude] -= speed, longitude:  from_location[:longitude])
				sleep 2
				diff = from_location[:latitude] - to_location[:latitude]
				p "Steped lat positive, from lat: #{from_location[:latitude]} , to lat: #{to_location[:latitude]}, difference: #{diff}"
			end
		elsif from_location[:latitude] < to_location[:latitude]
			until from_location[:latitude] >= to_location[:latitude]
				set_location(latitude:  from_location[:latitude] += speed, longitude:  from_location[:longitude])
				sleep 2
				diff = from_location[:latitude] - to_location[:latitude]
				p "Steped lat negtive, from lat: #{from_location[:latitude]}, to lat: #{to_location[:latitude]}, difference: #{diff}"
			end
		end
		
		if from_location[:longitude] > to_location[:longitude]
			until from_location[:longitude] <= to_location[:longitude]
				set_location(latitude:  from_location[:latitude], longitude:  from_location[:longitude] -= speed)
				sleep 2
				diff = from_location[:longitude] - to_location[:longitude]
				p "Steped long positive, from long: #{from_location[:longitude]}, to long: #{to_location[:longitude]}, difference: #{diff}"
			end
		elsif from_location[:longitude] < to_location[:longitude]
			until from_location[:longitude] >= to_location[:longitude]
				set_location(latitude:  from_location[:latitude] ,longitude:  from_location[:longitude] += speed)
				sleep 2
				diff = from_location[:longitude] - to_location[:longitude]
				p "Steped long negative, from long: #{from_location[:longitude]}, to long: #{to_location[:longitude]}, difference: #{diff}"
			end	
		end
		
		
		p "Current_location is #{to_location}"
				
		p "Refresh current location with set_location(latitude:  #{to_location[:latitude]} ,longitude:  #{to_location[:longitude]})"
	end

## Routine 1
walk_to(csir_location_home, csir_location_1) 						walk_to(csir_location_1, csir_location_home)
walk_to(csir_location_1, csir_gym_1) 										walk_to(csir_gym_1, csir_location_1)
walk_to(csir_gym_1, b_garden_location_1) 								walk_to(b_garden_location_1, csir_gym_1)
walk_to(b_garden_location_1, b_garden_location_2) 			walk_to(b_garden_location_2, b_garden_location_1)
walk_to(b_garden_location_2, b_garden_location_3) 			walk_to(b_garden_location_3, b_garden_location_2)
walk_to(b_garden_location_3, b_garden_location_4) 			walk_to(b_garden_location_4, b_garden_location_3)
walk_to(b_garden_location_4, b_garden_location_5) 			walk_to(b_garden_location_5, b_garden_location_4)
walk_to(b_garden_location_5, b_garden_location_6) 			walk_to(b_garden_location_6, b_garden_location_5)
walk_to(b_garden_location_6, b_garden_location_8) 			walk_to(b_garden_location_8, b_garden_location_6)
walk_to(b_garden_location_8, b_garden_location_9) 			walk_to(b_garden_location_9, b_garden_location_8)