# PAGO MENSUAL
class Pago
	attr_accessor :descripcion, :monto, :bono
	def initialize(descripcion, monto, bono)
		@descripcion, @monto, @bono = descripcion, monto, bono
	end
end

# UN EMPLEADO
class Empleado
	attr_accessor :nombre, :apellido, :dni, :pagos
	def initialize(nombre, apellido, dni)
		@nombre, @apellido, @dni = nombre, apellido, dni
		@pagos = []
	end

	def registar_pago(pago)
		pagos.push(pago)
	end

	def calcular_total_pagos
		total = 0.0
		for pago in pagos
			if pago.bono
				total += 1.15*pago.monto
			else
				total += pago.monto
			end
		end
		return total.round(2)
	end

	def calcular_impuesto
		total = calcular_total_pagos
		if total <= 25000
			pago = 0.0 
		elsif total <= 100000
			pago = (0.12)*(total - 25000) 
		else
			pago = (0.10)*(total - 25000) 
		end
		return pago.round(2)
	end
end

pago01 = Pago.new("Enero", 2000, false)
pago02 = Pago.new("Febrero", 2000, false)
pago03 = Pago.new("Marzo", 2500, true)
pago04 = Pago.new("Abril", 4000, true)
pago05 = Pago.new("Mayo", 6000, true)
pago06 = Pago.new("Junio", 8000, false)

emp = Empleado.new("Claudio", "Yacarini", "12345678")
emp.registar_pago(pago01)
emp.registar_pago(pago02)
emp.registar_pago(pago03)
emp.registar_pago(pago04)
emp.registar_pago(pago05)
emp.registar_pago(pago06)

puts "=========================================="
puts "EMPLEADO     :: #{emp.nombre} #{emp.apellido}"
puts "SUELDO TOTAL :: #{emp.calcular_total_pagos}"
puts "IMPUESTO     :: #{emp.calcular_impuesto}"
puts "=========================================="