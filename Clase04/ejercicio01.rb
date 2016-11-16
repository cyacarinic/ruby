class Empleado
	attr_accessor :nombre, :codigo, :apellido
	def initialize(nombre, codigo, apellido)
		@nombre, @codigo, @apellido = nombre, codigo, apellido
	end

	def calcular_sueldo
		return 0.00
	end
end


class Contratado < Empleado
	attr_accessor :nombre, :codigo, :apellido, :tarifa_hora, :horas_trabajadas
	def initialize(nombre, codigo, apellido, tarifa_hora, horas_trabajadas)
		super(nombre, codigo, apellido)
		@tarifa_hora, @horas_trabajadas = tarifa_hora, horas_trabajadas
	end

	def calcular_sueldo
		return (tarifa_hora*horas_trabajadas).round(2)
	end
end


class Estable < Empleado
	attr_accessor :nombre, :codigo, :apellido, :tipo_tarifa, :dias_trabajados
	def initialize(nombre, codigo, apellido, tipo_tarifa, dias_trabajados)
		super(nombre, codigo, apellido)
		@tipo_tarifa, @dias_trabajados = tipo_tarifa, dias_trabajados
	end

	def calcular_sueldo
		valor_tarifa = 0.0
		case tipo_tarifa.upcase
			when "A"
				valor_tarifa = 10
			else
				valor_tarifa = 40
		end
		return (valor_tarifa*dias_trabajados).round(2)
	end
end


class Empresa
	attr_accessor :empleados
	def initialize
		@empleados = []
	end

	def adicionar_empleado(emp)
		empleados.push(emp)
	end

	def imprimir_planilla
		for emp in empleados
			puts "EMPLEADO   :: #{emp.codigo} - #{emp.nombre} #{emp.apellido}"
			puts "SUELDO     :: #{emp.calcular_sueldo}"
		end
	end
end

emp01 = Contratado.new("Claudio", "123123", "Yacarini", 20.0, 160.0)
emp02 = Estable.new("Aldo", "456456", "Chiroque", "B", 30)
emp03 = Contratado.new("Yvan", "123123", "Yacarini", 10.0, 280.0)
emp04 = Estable.new("Jose", "456456", "Avalos", "A", 100)

yachay = Empresa.new
yachay.adicionar_empleado(emp01)
yachay.adicionar_empleado(emp02)
yachay.adicionar_empleado(emp03)
yachay.adicionar_empleado(emp04)

yachay.imprimir_planilla