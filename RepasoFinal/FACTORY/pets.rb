class Pet
	attr_accessor :name
	def initialize(name)
		@name=name
	end
end


class Dog < Pet
	def initialize(name)
		super(name)
	end
end


class Cat < Pet
	def initialize(name)
		super(name)
	end
end