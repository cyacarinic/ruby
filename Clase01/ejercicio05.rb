class Cliente
	attr_accessor :nombre, :tipo, :monto

	def initialize(nombre, tipo, monto)
		@nombre=nombre
		@tipo=tipo
		@monto=monto
	end

	def obtener_descuento_oro
		if monto > 1000
			return 0.8
		else
			return 1
		end
	end

	def obtener_descuento_plata
		if monto > 1200
			return 0.9
		else
			return 1
		end
	end

	def calcular_descuento
		if tipo == "ORO"
			return (monto*obtener_descuento_oro).round(2)
		else
			if tipo == "PLATA"
				return (monto*obtener_descuento_plata).round(2)
			else
				return (monto).round(2)
			end
		end
	end
end

cliente01 = Cliente.new("Claudio", "PLATA", 1200)
puts cliente01.calcular_descuento

cliente02 = Cliente.new("Fiama", "ORO", 1001)
puts cliente02.calcular_descuento

cliente03 = Cliente.new("Juan Perez", "Ninguno", 7000)
puts cliente03.calcular_descuento