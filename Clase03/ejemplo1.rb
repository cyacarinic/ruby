class Mascota
	attr_accessor :nombre, :raza
	def initialize(nombre, raza)
		@nombre=nombre
		@raza=raza
	end
end

class Perro < Mascota
	attr_accessor :tamanio
	def initialize(nombre, raza, tamanio)
		super(nombre, raza)
		@tamanio=tamanio
	end

	def descripcion
		puts "Hola, me llamo #{nombre}, soy un #{raza} y mido #{tamanio} m."
	end
end

class Gato < Mascota
	attr_accessor :nombre, :raza
	def initialize(nombre, raza)
		super(nombre, raza)
	end

	def maullar
		puts "#{nombre}-#{raza}, dice: Miaaaaauuu!"
	end
end

Byron = Perro.new("Byron", "Cocker", 0.30)
Warmi = Gato.new("Warmi", "Criolla")
Byron.descripcion
Warmi.maullar