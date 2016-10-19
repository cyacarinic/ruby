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

cliente = Cliente.new("Claudio", "PLATA", 1201)
puts cliente.calcular_descuento