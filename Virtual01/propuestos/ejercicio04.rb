class Trabajador
	attr_accessor :dni, :nombre, :apellido, :sueldo_base, :tipo, :sueldo_final
	def initialize
		@dni = solicitar_dato("DNI del trabajador")
		@nombre = solicitar_dato("Nombre del trabajador")
		@apellido = solicitar_dato("Apellido del trabajador")
		@sueldo_base = validar_numero(
				"sueldo del trabajador" ,
				solicitar_dato("Sueldo base del trabajador").to_f
			)
		@tipo = validar_tipo_servicio(solicitar_dato("Tipo del trabajador").upcase)
		@sueldo_final = calcular_sueldo
	end
	
	# Solicita ingresar un dato
	def solicitar_dato(nombre_dato, validos='')
		puts "Ingrese '#{nombre_dato.upcase}'"+validos
		return gets.chomp	
	end

	# Verifica que el valor ingresado sea un número real
	def validar_numero(campo, valor)
		until valor>0
			valor = solicitar_dato("Ingrese #{campo}",
					". Valido (numero mayor que cero)").to_f
		end
		return valor
	end

	# Listado de posibles tipos de servicio
	def menu_tipo
		menu = "Seleccione el tipo de trabajador"
		menu += "\n\tPlanilla"
		menu += "\n\tPor horas"
		menu += "\n\tParcial"
		return menu
	end

	# Verifica que el tipo del trabajador se encuentre en el listado
	def validar_tipo_servicio(valor)
		until valor == "PLANILLA" or
					valor == "POR HORAS" or
					valor == "PARCIAL"
			puts "Por favor, elija un tipo del menú"
			puts menu_tipo
			valor = gets.chomp.upcase
		end
		return valor
	end

	# Calcular el sueldo total según el tipo de trabajador
	def calcular_sueldo
		case tipo
			when "PLANILLA"
				sueldo_final = sueldo_base+300
			when "POR HORAS"
				sueldo_final = sueldo_base+400
			when "PARCIAL"
				sueldo_final = sueldo_base+500
		end
	end

end

trab = Trabajador.new
puts "\n===================="
puts "DNI : #{trab.dni}"
puts "Trabajador : #{trab.nombre} #{trab.apellido}"
puts "Tipo del trabajador : #{trab.tipo}"
puts "===================="
puts "Sueldo base    : #{trab.sueldo_base}"
puts "Sueldo final   : #{trab.sueldo_final}"
puts "===================="