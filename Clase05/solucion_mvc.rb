# MODELO TRABAJADOR
class Trabajador
	attr_accessor :dni, :nombre
	def initialize(dni, nombre)
		@dni, @nombre = dni, nombre
	end

	def calcular_sueldo
		return 0.00
	end
end


# MODELO OBRERO
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


# MODELO ADMINISTRATIVO
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


# MODELO PARCIAL
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


# MODELO EMPRESA-MODELO
class EmpresaModelo
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


# CONTROLADOR EMPRESA-CONTROLLER
class EmpresaController
	def initialize()
		@empresa_modelo=EmpresaModelo.new()
		@empresa_vista=EmpresaVista.new
	end

	def adicionartrabajador(trabajador)
		@empresa_modelo.registrar_trabajador(trabajador)
	end

	def cantidadtrabajadores
		@empresa_vista.cantidadtrabajadores(@empresa_modelo)
	end

	def sumadesueldos
		@empresa_vista.sumadesueldos(@empresa_modelo)
	end

	def buscarsueldotrabajador(dni)
		@empresa_vista.buscarsueldotrabajador(@empresa_modelo, dni)
	end
end


# VIEW EMPRESA-VIEW
class EmpresaVista
	def cantidadtrabajadores(model)
		puts "NRO DE TRABAJADORES      :: #{model.calcular_nro_trabajadores}"
	end

	def sumadesueldos(model)
		puts "SUMA DE SUELDOS          :: #{model.sumar_sueldos}"
	end

	def buscarsueldotrabajador(model, dni)
		puts "SUELDO DE '#{dni}'      :: #{model.sueldo_trabajador(dni)}"
	end
end


# INSTANCIA DEL CONTROLADOR
app = EmpresaController.new

# REGISTRO DE 05 TRABAJADORES EN EL CONTROLADOR
app.adicionartrabajador(Obrero.new("12312312", "Claudio Yacarini", 50, 0))
app.adicionartrabajador(Obrero.new("45645645", "Aldo Chiroque", 2, 2))
app.adicionartrabajador(Administrativo.new("78978978", "Claudio Aldo", 850, 1))
app.adicionartrabajador(Administrativo.new("14714714", "Yacarini Chiroque", 1000, 1))
app.adicionartrabajador(Parcial.new("25825825", "Aldo Yacarini", 1000))


# MUESTREO DE DATOS
app.cantidadtrabajadores
app.sumadesueldos
puts ""
app.buscarsueldotrabajador("46148321")
app.buscarsueldotrabajador("12312312")
app.buscarsueldotrabajador("14714714")