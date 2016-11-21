class Producto
	attr_accessor :descripcion, :precio
	def initialize(descripcion, precio)
		@descripcion, @precio = descripcion, precio
	end
end


class Pedido
	attr_accessor :producto, :cantidad
	def initialize(producto, cantidad)
		@producto, @cantidad = producto, cantidad
	end
end


class Carrito
	attr_accessor :pedidos
	def initialize
		@pedidos =[]
	end

	def ingresar_pedido(ped)
		pedidos.push(ped)
	end

	def calcular_total
		total = 0.0
		for ped in pedidos
			costo = ped.producto.precio * ped.cantidad
			total+=costo
		end
		return total.round(2)
	end
end


class Cliente
	attr_accessor :dni, :nombre, :apellido, :codigo_cliente, :carrito_de_compras, :dscto
	def initialize(dni, nombre, apellido, codigo_cliente)
		@dni, @nombre, @apellido, @codigo_cliente = dni, nombre, apellido, codigo_cliente
		@carrito_de_compras = Carrito.new
		@dscto = 10
	end

	def agregar_compra(compra)
		carrito_de_compras.ingresar_pedido(compra)
	end

	def obtener_total
		return carrito_de_compras.calcular_total
	end

	def calcular_puntos
		consumo = obtener_total
		puntos = 0.0
		if consumo > 200
			puntos = ((consumo/80).round()).round(2)
		end
		# return "#{dscto}% por #{puntos} punto(s)"
		return puntos/100*dscto
	end

	def presentar_cliente
		puts "============= DATOS DEL CLIENTE ============="
		puts "NOMBRE           : #{nombre}"
		puts "NOMBRE           : #{apellido}"
		puts "TOTAL DE CONSUMO : #{obtener_total}"
		puts "TOTAL DE PUNTOS  : #{calcular_puntos}"
		puts "============================================="
	end
end


class ClienteNormal < Cliente
	def initialize(dni, nombre, apellido, codigo_cliente)
		super(dni, nombre, apellido, codigo_cliente)
	end
end


class ClientePlatinium < Cliente
	def initialize(dni, nombre, apellido, codigo_cliente)
		super(dni, nombre, apellido, codigo_cliente)
		@dscto = 20
	end

	def calcular_puntos
		consumo = obtener_total
		puntos = 0.0
		if consumo > 500
			puntos = ((consumo/150).round()).round(2)
		end
		# return "#{dscto}% por #{puntos} punto(s)"
		return puntos/100*dscto
	end
end


class Supermercado
	attr_accessor :clientes, :nombre
	def initialize(nombre)
		@nombre = nombre
		@clientes = []
	end

	def registrar_cliente(clt)
		clientes.push(clt)
	end

	def calcular_compra_total_clientes
		compra_total = 0.0
		for clt in clientes
			compra_total+=clt.obtener_total
		end
		return compra_total
	end

	def calcular_puntos_total_clientes
		total_puntos = 0.0
		for clt in clientes
			total_puntos+=clt.calcular_puntos
		end
		return total_puntos
	end

	def buscar_cliente(dni)
		hallado = nil
		for clt in clientes
			if clt.dni == dni
				hallado = clt
			end
		end
		if hallado
			hallado.presentar_cliente
		else
			puts "==> NO EXISTE CLIENTE CON EL DNI INGRESADO"
		end
		
	end


end





# Nuevo super mercado
empresa = Supermercado.new("LIMA")

# Algunos productos para la compra
p01 = Producto.new("Producto 01", 10)
p02 = Producto.new("Producto 02", 5)
p03 = Producto.new("Producto 03", 1)

# Cliente Normal que compra un producto
claudio = ClienteNormal.new("12312312", "Claudio", "Yacarini", "07200201")
claudio.agregar_compra(Pedido.new(p01, 20))

# Se registra en el super mercado
empresa.registrar_cliente(claudio)

# Cliente sigue comprando sin registrarlo nuevamente
claudio.agregar_compra(Pedido.new(p02, 3))
claudio.agregar_compra(Pedido.new(p03, 11))

# Cliente Platinium y sus compras
aldo = ClientePlatinium.new("45645645", "Aldo", "Chiroque", "U201621489")
aldo.agregar_compra(Pedido.new(p02, 300))
aldo.agregar_compra(Pedido.new(p03, 1))

# Se registra al segundo cliente y sus compras
empresa.registrar_cliente(aldo)

# Se muestran estadisticas
puts ""
puts "-----------------------------------"
puts "TOTAL DE COMPRAS DE CLIENTES ==> #{empresa.calcular_compra_total_clientes}"
puts "TOTAL DE PUNTOS EN CAMPAÑA ==> #{empresa.calcular_puntos_total_clientes}"
puts "-----------------------------------"

puts ""
puts "BUSCANDO CLIENTE 41414141"
empresa.buscar_cliente("41414141")

puts ""
puts "BUSCANDO CLIENTE 12312312"
empresa.buscar_cliente("12312312")