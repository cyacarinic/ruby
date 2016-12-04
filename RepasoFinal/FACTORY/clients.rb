require './pets.rb'
require './clase_experta'

class Client
	attr_accessor :name, :pets
		def initialize(name)
			@name=name
			@pets=[]
		end

		def add_pet(type, name)
			pets.push(create_pet(type, name))
		end

		private
		def create_pet(type, name)
			# case type 
			# when "perro"
			# 	return Dog.new(name)
			# when "gato"
			# 	return Cat.new(name)
			# end
			PetFactory.create(type, name)
		end
end