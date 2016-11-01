# CLASE TRABAJADOR
class Trabajador
	attr_accessor :dni, :nombre, :apellido, :sueldo_base, :afp, :hrs_extras, :bono, :sueldo_bruto, :sueldo_neto
	def initialize(dni, nombre, apellido, sueldo_base, afp, hrs_extras)
		@dni = dni
		@nombre = nombre
		@apellido = apellido
		@sueldo_base = sueldo_base
		@afp = afp
		@hrs_extras = hrs_extras
		@bono = bono
		@sueldo_bruto
		@sueldo_neto
	end

	def calcular_bruto(bruto)
		@sueldo_bruto=bruto
	end

	def calcular_neto(neto)
		@sueldo_neto=neto
	end
end

# CLASE CONTROL
class Empresa
	attr_accessor :trabajadores, :precio_extra
	def initialize(precio_extra)
		@trabajadores=[]
		@precio_extra=precio_extra
	end

	def ingresar_trabajador(trab)
		trabajadores.push(trab)
	end

	def calcular_bono(trab)
		bono = (trab.sueldo_base*0.1).round(2)
		return bono
	end

	def calcular_extras(trab)
		extras = (trab.hrs_extras*precio_extra)
		return extras
	end

	def calcular_descuentos(trab)
		case trab.afp
			when "01"
				fondo = 0.1*trab.sueldo_bruto
				seguro = 0.0242*trab.sueldo_bruto
				comision = 0.021*trab.sueldo_bruto
			when "02"
				fondo = 0.1*trab.sueldo_bruto
				seguro = 0.0255*trab.sueldo_bruto
				comision = 0.018*trab.sueldo_bruto
			when "03"
				fondo = 0.1*trab.sueldo_bruto
				seguro = 0.0285*trab.sueldo_bruto
				comision = 0.020*trab.sueldo_bruto
			else # "04"
				fondo = 0.1*trab.sueldo_bruto
				seguro = 0.0214*trab.sueldo_bruto
				comision = 0.019*trab.sueldo_bruto
		end
		descuento = (fondo+seguro+comision).round(2)
		return descuento
	end

	def calcular_planilla
		pago_total = 0
		puts "=========================================="
		for trab in trabajadores
			puts "TRABAJADOR   :: #{trab.dni} - #{trab.nombre} #{trab.apellido}"
			extras = calcular_extras(trab)
			puts "HRS EXTRA    :: #{trab.hrs_extras} hrs = S/.#{extras}"
			bono = calcular_bono(trab)
			puts "BONO         :: S/.#{bono}"
			trab.calcular_bruto((bono+trab.sueldo_base+extras).round(2))
			# CALCULO DE DESCUENTOS
			dscto = calcular_descuentos(trab)
			puts "DESCUENTOS   :: - S/.#{dscto}"
			# CALCULO DE SUELDO NETO
			trab.calcular_neto((trab.sueldo_bruto-dscto).round(2))
			puts "SUELDO NETO  :: S/.#{trab.sueldo_neto}"
			puts "=========================================="
			pago_total+=trab.sueldo_neto
		end
		return pago_total
	end
end


# Ingreso de trabajadores
tr01 = Trabajador.new("12345678", "Claudio", "Yacarini", 2000, "01", 3)
tr02 = Trabajador.new("87654321", "Juan", "Perez", 1500, "02", 3)
tr03 = Trabajador.new("45678912", "Pepe", "Grillo", 2000, "03", 3)

# Registro de empresa y sus trabajadores
emp = Empresa.new(5.0)
emp.ingresar_trabajador(tr01)
emp.ingresar_trabajador(tr02)
emp.ingresar_trabajador(tr03)

# Calculo de planilla
total = emp.calcular_planilla
puts "==> EL TOTAL A PAGAR EN PLANILLA ES #{total}"


