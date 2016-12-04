class PetFactory
	def self.create(type, name)
		case type
		when "perro"
			return Dog.new(name)
		when "gato"
			return Cat.new(name)
		end
	end
end