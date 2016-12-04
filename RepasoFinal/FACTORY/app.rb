require './clients'

yo = Client.new("Claudio")
yo.add_pet("perro", "Byron")
yo.add_pet("gato", "Warmi")
puts ""
for pet in yo.pets
	puts pet.name
end