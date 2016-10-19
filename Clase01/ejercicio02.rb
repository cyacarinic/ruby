class Piscina
	attr_accessor :largo, :ancho, :profundidad
	def initialize(largo, ancho, profundidad)
		@largo=largo
		@ancho=ancho
		@profundidad=profundidad
	end

	def calcular_volumen
		return largo*ancho*profundidad
	end

	def llenar_piscina
		return 3*(calcular_volumen/4)
	end

	def calcular_cloro
		return 0.015*(llenar_piscina/1.5)
	end

end

piscina = Piscina.new(10, 30, 20)
puts "Para la piscina se necesitara #{piscina.calcular_cloro} gr de Cloro"