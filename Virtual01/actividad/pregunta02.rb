class Viaje
	# Inicializacion solicitando los datos del viaje
	attr_accessor :tipo_servicio, :nro_kms, :nro_pasajeros
	def initialize()
		puts menu_servicio+"\n\n"
		@tipo_servicio = validar_tipo_servicio(
				solicitar_dato("'Tipo de servicio'").upcase
			)
		@nro_kms = validar_numero(
				"'Kilometraje" ,
				solicitar_dato("'Kilometraje del viaje'").to_f,
				Float
			)
		@nro_pasajeros = validar_maximo(
				"'Número de Pasajeros" ,
				solicitar_dato("'Numero de pasajeros'").to_i,
				5
			)
	end

	# Listado de posibles tipos de servicio
	def menu_servicio
		menu = "Seleccione tipo de servicio"
		menu += "\n\tDistrital"
		menu += "\n\tInterprovincial"
		menu += "\n\tInterdepartamental"
		return menu
	end

	# Solicita ingresar un dato
	def solicitar_dato(nombre_dato)
		puts "Ingrese #{nombre_dato}"
		return gets.chomp	
	end


	# Verifica que el valor ingresado sea un número del tipo que se indique
	def validar_numero(campo, valor, tipo)
		until valor>0
			puts "Ingrese #{campo} valido (numero mayor que cero)"
			if tipo == Fixnum
				valor = gets.chomp.to_i
			else
				valor = gets.chomp.to_f
			end
		end
		return valor
	end

	# Verifica que el valor no supere al maximo indicado
	def validar_maximo(campo, valor, maximo)
		until valor<=maximo and valor > 0
			puts "Ingrese #{campo} valido (máximo #{maximo})"
			valor = gets.chomp.to_i
		end
		return valor
	end

	# Verifica que el tipo de servicio se encuentre en el listado
	def validar_tipo_servicio(valor)
		until valor == "DISTRITAL" or
					valor == "INTERPROVINCIAL" or
					valor == "INTERDEPARTAMENTAL"
			puts "Por favor, elija un servicio del menú"
			puts menu_servicio
			valor = gets.chomp.upcase
		end
		return valor
	end

	# Calcula el costo por kilometro segun los datos del ejercicio
	def costo_por_km
		case tipo_servicio.downcase
			when "distrital"
				if nro_pasajeros <= 3
					return 0.5
				else
					return 0.7
				end
			when "interprovincial"
				if nro_pasajeros <= 3
					return 0.8
				else
					return 0.9
				end
				
			when "interdepartamental"
				if nro_pasajeros <= 3
					return 1.25
				else
					return 1.5
				end
			else
				return 0				
		end
	end

	# Calcula la tarifa
	def calcular_tarifa
		return costo_por_km*nro_kms
	end

end

viaje = Viaje.new()
respuesta = "El viaje '#{viaje.tipo_servicio}',"
respuesta += "de '#{viaje.nro_pasajeros}' Pasajeros,"
respuesta += "por '#{viaje.nro_kms}' kms"
respuesta += " costará #{viaje.calcular_tarifa}"

puts respuesta