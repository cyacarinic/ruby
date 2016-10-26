# Producto de la tienda
class Producto
	attr_accessor :codigo, :nombre, :precio
	def initialize(codigo, nombre, precio)
		@codigo, @nombre, @precio = codigo, nombre, precio
	end
end

# Compra de un producto X
class Compra
	attr_accessor :producto, :cantidad
	def initialize(prod, cant)
		@producto, @cantidad = prod, cant
	end
end

# Compras de un cliente
class Venta
	attr_accessor :cliente, :compras
	def initialize(cliente)
		@compras = []
		@cliente = cliente
	end

	def ingresar_compra(compra)
		puts "Estas comprando #{compra.cantidad} #{compra.producto.nombre}(s)"
		compras.push(compra)
	end

	def calcular_total
		total = 0.0
		for compra in compras
			total+=(compra.producto.precio*compra.cantidad)
		end
		return total.round(2)
	end

	def calcular_descuento
		total = calcular_total
		if total > 200
			return (0.2*total).round(2)
		elsif total > 150
			return (0.1*total).round(2)
		else
			return (0*total).round(2)
		end
	end

	def calcular_mas_caro
		mas_caro = compras[0].producto
		for compra in compras
			if compra.producto.precio > mas_caro.precio
				mas_caro = compra.producto
			end
		end
		puts "El producto mas caro de #{cliente} es #{mas_caro.codigo}-#{mas_caro.nombre} y cuesta #{mas_caro.precio}"
	end
end

# Clase Control
class Empresa
	attr_accessor :ventas
	def initialize
		@ventas = []
	end

	def registar_venta(venta)
		ventas.push(venta)
	end

	def obtener_datos_ventas
		for venta in ventas
			puts "El total vendido a #{venta.cliente} fue #{venta.calcular_total}"
			puts "El descuento recibido por #{venta.cliente} fue #{venta.calcular_descuento}"
			puts venta.calcular_mas_caro
		end
	end
end


# INVENTARIO DE PRODUCTOS
prod01 = Producto.new("P001", "Galleta", 0.50)
prod02 = Producto.new("P002", "Kg Arroz", 3.50)
prod03 = Producto.new("P003", "Cuaderno", 2.20)
prod04 = Producto.new("P004", "Vino Copello", 14.00)

# CARRITO DE COMPRAS
com01 = Compra.new(prod01, 3)
com02 = Compra.new(prod02, 1)
com03 = Compra.new(prod03, 7)
com04 = Compra.new(prod04, 10)

# VENTAS
venta01 = Venta.new("Claudio Yacarini")
venta01.ingresar_compra(com01)
venta01.ingresar_compra(com02)
venta01.ingresar_compra(com03)
venta01.ingresar_compra(com04)

# EMPRESA DE VENTAS
emp = Empresa.new
# OPERACIONES DE CAJA
emp.registar_venta(venta01)
emp.obtener_datos_ventas
