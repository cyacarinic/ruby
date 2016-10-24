class Auto
	attr_accessor :modelo, :color, :edad_propietario
	def initialize()
		@modelo = validar_modelo(ingresar_dato("modelo del auto").upcase)
		@color = ingresar_dato("Color del auto", ". (Blanco, Metalizado, otros..)")
		@edad_propietario = validar_numero( ingresar_dato("Edad del propietario", ". Valores enteros").to_i)
	end

	# Ingreso de dato
	def ingresar_dato(nombre_dato, validos='')
		puts "Ingresar '#{nombre_dato.upcase}'"+validos
		return gets.chomp
	end

	# Valida que sea del tipo A o B
	def validar_modelo(valor)
		until valor == "A" or valor == "B"
			valor = ingresar_dato("modelo", " válido. (Elejir entre A o B)").upcase
		end
		return valor
	end

	# Verifica que el valor ingresado sea un número entero
	def validar_numero(valor)
		until valor>0
			valor = ingresar_dato("edad", " válida. (entero mayor que cero)").to_i
		end
		return valor
	end

	# Calcular el Importe de seguro segun color y modelo
	def calcular_seguro
		case color.upcase
			when "BLANCO"
				if modelo.upcase == "A"
					return 240
				else	# modelo B
					return 300
				end
			when "METALIZADO"
				if modelo.upcase == "A"
					return 330
				else 	# modelo B
					return 360
				end
			else	# otro color
				if modelo.upcase == "A"
					return 270
				else 	# modelo B
					return 330
				end
		end				
	end

	# Calcular el INCREMENTO segun la edad del propietario
	def calcular_incremento
		if edad_propietario < 26
			return 1.25
		elsif edad_propietario >=26 and edad_propietario <= 30
			return 1.10
		elsif edad_propietario > 65
			return 1.1
		else 
			return 1
		end

	end

	# Calcula el total a pagar
	def calcular_total
		return calcular_seguro*calcular_incremento
	end
end

auto = Auto.new
respuesta = "El propietario de #{auto.edad_propietario} anios, "
respuesta += "cuyo auto es modelo '#{auto.modelo}' y color #{auto.color}"
respuesta += "pagará  S/.#{auto.calcular_total} soles"

puts respuesta
