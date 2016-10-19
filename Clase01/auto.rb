class Auto
	def initialize(marca, modelo, anio, color, placa)
		@marca = marca
		@modelo = modelo
		@anio = anio
		@color = color
		@placa = placa
	end

	def encender
		return "Encendiendo motor del auto #{@marca}"
	end

	def avanzar
		return "El auto #{@marca} #{@modelo} del #{@anio} esta en movimiento"
	end

	def parar
		return "Se detuvo el auto de placa #{@placa}"
	end
end

carro = Auto.new("Toyota", "Yaris", 2016, "Rojo", "Tres")

puts carro.encender
puts carro.avanzar
puts carro.parar

