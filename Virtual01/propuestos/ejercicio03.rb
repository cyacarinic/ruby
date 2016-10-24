class Venta
	attr_accessor :mes, :valor
	def initialize
		@mes = ingresar_dato("mes de la venta")
		@valor = validar_real("valor de la venta", ingresar_dato("valor de la venta").to_f)
	end

	# Ingreso de dato
	def ingresar_dato(nombre_dato, validos='')
		puts "Ingresar '#{nombre_dato.upcase}'"+validos
		return gets.chomp
	end

	# Validar real
	def validar_real(nombre_dato, valor)
		until valor>0
			puts "Ingrese #{nombre_dato} valido (numero mayor que cero)"
			valor = gets.chomp.to_f
		end
		return valor
	end

end


class Cuenta
	attr_accessor :ultimas_ventas
	def initialize(cant_ventas)
		@ultimas_ventas = []
		ingresar_ventas(cant_ventas)
	end

	# Instanciar ventas "nro_ventas" veces
	def ingresar_ventas(nro_ventas)
		i=1
		until i > nro_ventas
			ultimas_ventas.push(Venta.new)
			i+=1
		end
	end

	# Calcular el promedio de las ventas ingresadas
	def calcular_promedio
		suma = 0
		for venta in ultimas_ventas
			suma+=venta.valor
		end
		return suma/ultimas_ventas.length
	end

	# Ordenar las ventas segun su valor
	def ordernar_ventas
		puts "Ordenando ventas"
		ultimas_ventas.sort! {|a,b| a.valor <=> b.valor}		
	end

	# Calcular el mes de mayor y menor venta
	def obtener_mayor_menor_venta
		ordernar_ventas
		respuesta = "La mayor venta es #{ultimas_ventas.last.valor}"
		respuesta += ", corresponde al mes de #{ultimas_ventas.last.mes}."
		respuesta += "\nLa menor venta es #{ultimas_ventas.first.valor}"
		respuesta += ", Corresponde al mes de #{ultimas_ventas.first.mes}"
		return respuesta
	end

	# Calcular los meses de ventas mayores al promedio
	def obtener_ventas_mayor_promedio
		meses = []
		for venta in ultimas_ventas
			if venta.valor > calcular_promedio
				meses.push(venta.mes)
			end
		end
		return meses
	end

end


cuenta = Cuenta.new(6)

puts "=================="
puts "Promedio de ventas #{cuenta.calcular_promedio.round(2)}"
puts "=================="
puts cuenta.obtener_mayor_menor_venta
puts "=================="
puts "Los meses de que superaron el promedio fueron #{cuenta.obtener_ventas_mayor_promedio}"
puts "=================="
