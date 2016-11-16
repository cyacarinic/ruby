# Variable global para settear el año actual
$anio_actual=2016

class Vehiculo
	attr_accessor :placa, :marca, :modelo, :anio, :precio_base
	def initialize(placa, marca, modelo, anio, precio_base)
		@placa = placa
		@marca = marca
		@modelo = modelo
		@anio = anio
		@precio_base = precio_base
	end

	def calcular_prima
		return ( (precio_base)/(10.00*($anio_actual-anio+1)) ).round(2)
	end
end


class Auto < Vehiculo
	attr_accessor :placa, :marca, :modelo, :anio, :precio_base
	def initialize(placa, marca, modelo, anio, precio_base)
		super(placa, marca, modelo, anio, precio_base)
	end
end


class Camioneta < Vehiculo
	attr_accessor :placa, :marca, :modelo, :anio, :precio_base, :tipo_transmision
	def initialize(placa, marca, modelo, anio, precio_base, tipo_transmision)
		super(placa, marca, modelo, anio, precio_base)
		@tipo_transmision = tipo_transmision
	end

	def calcular_prima
		prima = (precio_base)/(10.00*($anio_actual-anio+1))
		if tipo_transmision.upcase == "AT"
			prima = prima*1.1
		end # ELSE: Manual -> Prima no varía
		return prima.round(2)
	end
end


class Bus < Vehiculo
	attr_accessor :placa, :marca, :modelo, :anio, :precio_base, :nro_ejes, :nro_asientos
	def initialize(placa, marca, modelo, anio, precio_base, nro_ejes, nro_asientos)
		super(placa, marca, modelo, anio, precio_base)
		@nro_ejes, @nro_asientos = nro_ejes, nro_asientos
	end

	def calcular_prima
		return ( (precio_base+nro_asientos*10.00)/(nro_ejes*($anio_actual-anio+1)) ).round(2)
	end
end


class Cliente
	attr_accessor :vehiculos, :dni, :nombre, :apellido, :telefono
	def initialize(dni, nombre, apellido, telefono)
		@dni, @nombre, @apellido, @telefono = dni, nombre, apellido, telefono
		@vehiculos = []
	end

	def comprar_vehiculo(vehi)
		vehiculos.push(vehi)
	end

	def calcular_total_prima
		total = 0.0
		for vehi in vehiculos
			total+=vehi.calcular_prima
		end
		return total
	end

	def listar_vehiculos
		total_prima = 0.0
		puts "============ VEHICULOS DE #{nombre} ============="
		for vehi in vehiculos
			puts "PLACA          :: #{vehi.placa}"
			puts "MARCA          :: #{vehi.marca}"
			puts "MODELO         :: #{vehi.modelo}"
			if vehi.instance_of? Auto
				puts "TIPO           :: Auto"
			elsif vehi.instance_of? Camioneta
				puts "TIPO           :: Camioneta"
				puts "TRANSMISION    :: #{vehi.tipo_transmision}"
			elsif vehi.instance_of? Bus
				puts "TIPO           :: Bus"
			end
			puts "PRIMA         :: #{vehi.calcular_prima}"
			total_prima+=vehi.calcular_prima
			puts "================================================="
		end
		puts "TOTAL PRIMA    :: #{calcular_total_prima}"
		puts "================================================="
	end
end


class Empresa
	attr_accessor :clientes
	def initialize
		@clientes = []
	end

	def registrar_cliente(clt)
		clientes.push(clt)
	end

	def calcular_cobro
		total = 0.0
		for clt in clientes
			total+=clt.calcular_total_prima
		end
		return total.round(2)
	end

	def calcular_total_vehiculos
		total = 0
		for clt in clientes
			total+=clt.vehiculos.size
		end
		return total
	end
end


v01 = Auto.new("123", "Toyota", "Yaris", 2010, 8000)
v02 = Camioneta.new("456", "VolksWagen", "Fox?", 2012, 10000, "AT")
v03 = Auto.new("789", "Chevrolet", "Sonic", 2015, 12000)
v04 = Bus.new("101", "Volvo", "Orion", 1999, 3000, 5, 30)
v05 = Bus.new("112", "Volvo", "JV", 1995, 1500, 4, 30)


clt01 = Cliente.new("12312312", "Claudio", "Yacarini", "999999999")
clt01.comprar_vehiculo(v01)
clt01.comprar_vehiculo(v02)

clt02 = Cliente.new("45645645", "Aldo", "Chiroque", "5555555")
clt02.comprar_vehiculo(v03)
clt02.comprar_vehiculo(v04)
clt02.comprar_vehiculo(v05)

clt01.listar_vehiculos
puts ""
puts ""
clt02.listar_vehiculos


yachay = Empresa.new
yachay.registrar_cliente(clt01)
yachay.registrar_cliente(clt02)

puts "TOTAL VEHICULOS ASEGURADOS = #{yachay.calcular_total_vehiculos}"
puts "TOTAL A COBRAR = #{yachay.calcular_cobro}"