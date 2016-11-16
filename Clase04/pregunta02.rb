class PaqueteViaje
	attr_accessor :nombre, :duracion, :costo
	def initialize(nombre, duracion, costo)
		@nombre, @duracion, @costo = nombre, duracion, costo
	end

	def presentar_paquete
		return ""
	end
end


class Urbano < PaqueteViaje
	attr_accessor :nombre, :duracion, :costo, :hotel
	def initialize(nombre, duracion, costo, hotel)
		super(nombre, duracion, costo)
		@hotel = hotel
	end

	def presentar_paquete
		return "Nombre del paquete: #{nombre}\nDuración: #{duracion} día(s)\nCosto: #{costo} sol(es)\nNombre del hotel: #{hotel}"
	end
end


class Historico < PaqueteViaje
	attr_accessor :nombre, :duracion, :costo, :tiempo_viaje, :precio_entradas
	def initialize(nombre, duracion, costo, tiempo_viaje, precio_entradas)
		super(nombre, duracion, costo)
		@tiempo_viaje, @precio_entradas = tiempo_viaje, precio_entradas
	end

	def presentar_paquete
		return "Nombre del paquete: #{nombre}\nDuración: #{duracion} día(s)\nCosto: #{costo} sol(es)\nTiempo de viaje: #{tiempo_viaje} minuto(s)\nPrecio de entradas: #{precio_entradas} sol(es)"
	end
end


class Aventura < PaqueteViaje
	attr_accessor :nombre, :duracion, :costo, :aseguradora, :precio_equipos
	def initialize(nombre, duracion, costo, aseguradora, precio_equipos)
		super(nombre, duracion, costo)
		@aseguradora, @precio_equipos = aseguradora, precio_equipos
	end

	def presentar_paquete
		return "Nombre del paquete: #{nombre}\nDuración: #{duracion} día(s)\nCosto: #{costo} sol(es)\nAseguradora: #{aseguradora}\nPrecio de equipos: #{precio_equipos} sol(es)"
	end
end


class Empresa
	attr_accessor :paquetes
	def initialize
		@paquetes = []
	end

	def registrar_paquete(paq)
		paquetes.push(paq)
	end

	def listar_paquetes
		for paq in paquetes
			puts paq.presentar_paquete
			puts "================================================"
		end
	end
end

class Cliente
	attr_accessor :paquetes
	def initialize
		@paquetes = []
	end

	def inscribirse(paq)
		paquetes.push(paq)
	end

	def calcular_precio_total
		total = 0.0
		for paq in paquetes
			total+=paq.costo
			if paq.instance_of? Urbano
				total+=0
			elsif paq.instance_of? Historico
				total+=paq.precio_entradas
			else # Aventura
				total+=paq.precio_equipos
			end
		end
		return total.round(2)
	end

	def calcular_tiempo_total
		dias = 0.0
		minutos = 0.0
		for paq in paquetes
			dias+=paq.duracion
			if paq.instance_of? Historico
				minutos+=paq.tiempo_viaje
			end
		end
		return "#{dias} día(s) y #{minutos} minuto(s)"
	end

	def listar_paquetes
		for paq in paquetes
			puts "Paquete Contratado:                   #{paq.nombre}"
		end
		puts "Costo total:                          #{calcular_precio_total} sol(es)"
		puts "Tiempo total de viaje:                #{calcular_tiempo_total}"
		puts "================================================"
	end
end


p01 = Urbano.new("City Tour Ventanilla xD", 2, 150, "Steffany's")
p02 = Historico.new("Visita al museo de Oro", 1, 120, 20, 2)
p03 = Aventura.new("Tarapoto Silvestre", 3, 500, "GG WP SAC", 30)

yachay = Empresa.new
yachay.registrar_paquete(p01)
yachay.registrar_paquete(p02)
yachay.registrar_paquete(p03)
puts "============= PAQUETES DISPONIBLES ============="
yachay.listar_paquetes
puts ""

puts "============= PAQUETES DEL CLIENTE ============="
clt = Cliente.new
clt.inscribirse(p01)
clt.inscribirse(p02)
clt.inscribirse(p03)
clt.listar_paquetes