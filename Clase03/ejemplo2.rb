class Item
	attr_accessor :codigo, :titulo, :duracion, :prestado, :comentario
	def initialize(codigo, titulo, duracion, prestado, comentario)
		@codigo, @titulo, @duracion, @prestado, @comentario = codigo, titulo, duracion, prestado, comentario
	end

	def presentar_ITEM()
		puts "CODIGO: #{codigo}"
		puts "TITULO: #{titulo}"
		puts "DIRECTOR: #{duracion}"
		puts "COMENTARIO: #{comentario}"
		puts "PRESTADO: #{prestado}"
	end
end

class CD < Item
	attr_accessor :artista, :nro_pistas
	def initialize(codigo, titulo, duracion, prestado, comentario, artista, nro_pistas)
		super(codigo, titulo, duracion, prestado, comentario)
		@artista, @nro_pistas = artista, nro_pistas
	end

	def presentar()
		puts "======== DETALLE DEL CD ========"
		presentar_ITEM()
		puts "ARTISTA: #{artista}"
		puts "PISTAS: #{nro_pistas}"
	end
end

class DVD < Item
	attr_accessor :director
	def initialize(codigo, titulo, duracion, prestado, comentario, director)
		super(codigo, titulo, duracion, prestado, comentario)
		@director = director
	end

	def presentar()
		puts "======== DETALLE DEL DVD ========"
		presentar_ITEM()
		puts "DIRECTOR: #{director}"
	end
end

class Tienda
	attr_accessor :items
	def initialize
		@items = []
	end

	def registar_item(item)
		items.push(item)
	end

	def listar()
		for item in items
			item.presentar()
		end
	end

	def buscar(cod)
		item = items.find{|a| a.codigo == cod}
		if item
			puts "El titulo del item '#{cod}' es '#{item.titulo}'"
		else
			puts "No existe item para el código '#{cod}'"
		end
	end
end

tiendita = Tienda.new()
tiendita.registar_item(CD.new("07200201", "The Open Door", "1:25 hrs", "NO", "GJ!", "Evanescence", 12))
tiendita.registar_item(DVD.new("U201621489", "Dr Strange", "2:25", "SI", "No vista", "Invoker"))
tiendita.listar()
puts "================================="
tiendita.buscar("U201621489")
tiendita.buscar("123")