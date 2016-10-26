# CLASE TRABAJADOR
class Trabajador
	attr_accessor :dni, :nombre, :tipo, :hrs_trabajadas, :prod_vendidos
	def initialize(dni, nombre, tipo)
		@dni, @nombre, @tipo = dni, nombre, tipo
		@hrs_trabajadas
		@prod_vendidos
	end

	def registar_trabajo(hrs_trabajadas, prod_vendidos)
		@hrs_trabajadas, @prod_vendidos = hrs_trabajadas, prod_vendidos
	end
end

# CLASE CONTROL
class Empresa
	attr_accessor :trabajadores, :precio_hora
	def initialize(precio_hora)
		@trabajadores=[]
		@precio_hora=precio_hora
	end

	def ingresar_trabajador(trab)
		trabajadores.push(trab)
	end

	def pagar_fijo(trab)
		return (trab.hrs_trabajadas*precio_hora).round(2)
	end

	def pagar_contratado(trab)
		if trab.prod_vendidos < 50
			return 100
		elsif trab.prod_vendidos < 100
			return 150
		else
			return 250
		end
	end

	def calcular_sueldo_total
		total = 0.0
		for trabajador in trabajadores
			if trabajador.tipo.upcase == "FIJO"
				total+=pagar_fijo(trabajador)
			else # CONTRATADO
				total+=pagar_contratado(trabajador)
			end
		end
		return total.round(2)
	end

	def calcular_sueldo_promedio
		total = calcular_sueldo_total
		promedio = calcular_sueldo_total/trabajadores.size.round(2)
		return promedio.round(2)
	end

	def total_trabajadores
		return trabajadores.size
	end

end


# Ingreso de trabajadores
tr01 = Trabajador.new("12345678", "Claudio Yacarini", "FIJO")
tr01.registar_trabajo(5, 3)
tr02 = Trabajador.new("87654321", "Juan Perez", "CONTRATADO")
tr02.registar_trabajo(2, 1)
tr03 = Trabajador.new("45678912", "Pepe Grillo", "CONTRATADO")
tr03.registar_trabajo(10, 8)

# Registro de empresa y sus trabajadores
emp = Empresa.new(30)
emp.ingresar_trabajador(tr01)
emp.ingresar_trabajador(tr02)
emp.ingresar_trabajador(tr03)

# Calculo de salario total
puts "El numero de trabajadores es #{emp.total_trabajadores}"
puts "El total a pagar es #{emp.calcular_sueldo_total}"
puts "El salario promedio es #{emp.calcular_sueldo_promedio}"


