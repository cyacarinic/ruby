class Trabajador
	attr_accessor :dni, :nombre
	def initialize(dni, nombre)
		@dni, @nombre = dni, nombre
	end

	def calcular_sueldo
		return 0.00
	end
end


class Obrero < Trabajador
	attr_accessor :dni, :nombre, :hrs_trabajadas, :hrs_extras
	def initialize(dni, nombre, hrs_trabajadas, hrs_extras)
		super(dni, nombre)
		@hrs_trabajadas, @hrs_extras = hrs_trabajadas, hrs_extras
	end

	def calcular_sueldo
		return (hrs_trabajadas*30+hrs_extras*40).round(2)
	end
end

class Administrativo < Trabajador
	attr_accessor :dni, :nombre, :sueldo_base, :ventas_efectuadas
	def initialize(dni, nombre, sueldo_base, ventas_efectuadas)
		super(dni, nombre)
		@sueldo_base, @ventas_efectuadas = sueldo_base, ventas_efectuadas
	end

	def calcular_sueldo
		return (sueldo_base+0.05*ventas_efectuadas).round(2)
	end
end


class Parcial < Trabajador
	attr_accessor :dni, :nombre, :sueldo_base
	def initialize(dni, nombre, sueldo_base)
		super(dni, nombre)
		@sueldo_base = sueldo_base
	end

	def calcular_sueldo
		return (0.94*sueldo_base).round(2)
	end
end


class Empresa
	attr_accessor :trabajadores
	def initialize
		@trabajadores = []
	end

	def registrar_trabajador(trab)
		trabajadores.push(trab)
	end

	def calcular_nro_trabajadores
		return trabajadores.count
	end

	def sumar_sueldos
		total = 0.0
		for trab in trabajadores
			total += trab.calcular_sueldo
		end
		return total
	end

	def sueldo_trabajador(dni)
		sueldo = "No existe trabajador con dni #{dni}"
		for trab in trabajadores
			if trab.dni == dni
				sueldo = trab.calcular_sueldo
				break
			end
		end
		return sueldo
	end
end

tr01 = Obrero.new("12312312", "Claudio Yacarini", 50, 0)
tr02 = Obrero.new("45645645", "Aldo Chiroque", 2, 2)
tr03 = Administrativo.new("78978978", "Claudio Aldo", 850, 1)
tr04 = Administrativo.new("14714714", "Yacarini Chiroque", 1000, 1)
tr05 = Parcial.new("25825825", "Aldo Yacarini", 1000)

yachay = Empresa.new
yachay.registrar_trabajador(tr01)
yachay.registrar_trabajador(tr02)
yachay.registrar_trabajador(tr03)
yachay.registrar_trabajador(tr04)
yachay.registrar_trabajador(tr05)

puts "NRO DE TRABAJADORES      :: #{yachay.calcular_nro_trabajadores}"
puts "SUMA DE SUELDOS          :: #{yachay.sumar_sueldos}"
puts ""

hallado = yachay.sueldo_trabajador("46148321")
puts "SUELDO DE 46148321'      :: #{hallado}"

hallado = yachay.sueldo_trabajador("12312312")
puts "SUELDO DE 123123'        :: #{hallado}"

hallado = yachay.sueldo_trabajador("14714714")
puts "SUELDO DE 14714714'      :: #{hallado}"