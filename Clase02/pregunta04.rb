# PAGO
class Pago
	attr_accessor :mes, :monto, :tipo_pago
	def initialize(mes, monto, tipo_pago)
		@mes, @monto, @tipo_pago = mes, monto, tipo_pago
	end
end

# CONCURENCIA DE UN CLINTE
class Cliente
	attr_accessor :nombre, :pagos
	def initialize(nombre)
		@nombre = nombre
		@pagos = []
	end

	def registrar_pago(pago)
		pagos.push(pago)
	end
end

# ADMINISTRACION DEL CLIENTE
class GIMS
	attr_accessor :clientes
	def initialize
		@clientes = []
	end

	def registrar_cliente(clte)
		clientes.push(clte)
	end

	def pagos_cliente_total
		for cliente in clientes
			total = 0.0
			for pago in cliente.pagos
				if pago.tipo_pago.upcase == "TARJETA"
					total += 1.04*pago.monto
				else
					total += pago.monto
				end				
			end
			puts "===================================="
			puts "CLIENTE         :: #{cliente.nombre}"
			puts "MESES SUSCRITOS :: #{cliente.pagos.size}"
			puts "TOTAL PAGADO    :: #{total}"			
		end
		puts "===================================="
	end

	def pagos_cliente_tarjeta
		for cliente in clientes
			total = 0.0
			for pago in cliente.pagos
				if pago.tipo_pago.upcase == "TARJETA"
					total += 1.04*pago.monto
				end				
			end
			puts "===================================="
			puts "CLIENTE               :: #{cliente.nombre}"
			puts "TOTAL PAGADO TARJETA  :: #{total}"
		end
		puts "===================================="
	end
end

# REGISTRO DE PAGOS MENSUALES
pago01 = Pago.new("Enero", 100, "Tarjeta")
pago02 = Pago.new("Febrero", 100, "TARJETA")
pago03 = Pago.new("Marzo", 100, "Efectivo")
pago04 = Pago.new("Abril", 100, "Efectivo")
pago05 = Pago.new("Mayo", 100, "tarjeta")
pago06 = Pago.new("Mayo", 100, "efectivo")

# CLIENTES Y SUS PAGOS
cliente01 = Cliente.new("Claudio Yacarin")
cliente01.registrar_pago(pago01)
cliente01.registrar_pago(pago02)
cliente01.registrar_pago(pago03)
cliente01.registrar_pago(pago04)
cliente01.registrar_pago(pago05)

cliente02 = Cliente.new("Juan Perez")
cliente02.registrar_pago(pago04)
cliente02.registrar_pago(pago06)

# ADMINISTRACION DEL GYM
gimnasio = GIMS.new()
gimnasio.registrar_cliente(cliente01)
gimnasio.registrar_cliente(cliente02)

# MUESTREO DE DATOS
gimnasio.pagos_cliente_total
gimnasio.pagos_cliente_tarjeta