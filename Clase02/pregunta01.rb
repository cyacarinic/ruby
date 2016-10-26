class Venta
	# Clase N
	attr_accessor :monto, :mes
	def initialize(mes, monto)
		@monto, @mes = monto, mes
	end
end


class Empresa
	# Clase controladora
	attr_accessor :ventas
	def initialize()
		@ventas=[]
	end

	def ingresar_venta(venta)
		ventas.push(venta)
	end

	def determinar_mayor
		mayor=ventas[0].monto
		indice=0
		for i in 0..ventas.size-1
			if ventas[i].monto > mayor
				indice=i
				mayor=ventas[i].monto
			end
		end
		puts "El mes de mayor venta es #{ventas[i].mes} con monto = #{mayor}"
	end

	def determinar_menor
		menor=ventas[0].monto
		indice=0
		for i in 0..ventas.size-1
			if ventas[i].monto < menor
				indice=i
				menor=ventas[i].monto
			end
		end
		puts "El mes de menor venta es #{ventas[i].mes} con monto = #{menor}"
	end

	def determinar_promedio
		suma=0.0
		for i in 0..ventas.size-1
			suma+=ventas[i].monto
		end
		promedio = suma/ventas.size
		return promedio.round(2)
	end

	def determinar_mayor_promedio(prom)
		mayores=[]
		for i in 0..ventas.size-1
			if ventas[i].monto > prom
				mayores.push(ventas[i].mes)
			end
		end
		return mayores
	end
end

v1 = Venta.new("Enero", 1000)
v2 = Venta.new("Febrero", 3000)
v3 = Venta.new("Marzo", 2000)
v4 = Venta.new("Abril", 800)
v5 = Venta.new("Mayo", 1500)
#v6 = Venta.new("Junio", 1000)
emp = Empresa.new()
emp.ingresar_venta(v1)
emp.ingresar_venta(v2)
emp.ingresar_venta(v3)
emp.ingresar_venta(v4)
emp.ingresar_venta(v5)
#emp.ingresar_venta(v6)
emp.determinar_mayor
emp.determinar_menor
promedio = emp.determinar_promedio
puts "El promedio de ventas es #{promedio}"
meses_mayores = emp.determinar_mayor_promedio(promedio)
puts "Los meses de ventas mayores al promedio son #{meses_mayores}"