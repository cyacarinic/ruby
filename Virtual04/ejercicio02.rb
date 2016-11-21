class Juego
	attr_accessor :puntaje_base, :precio
	def initialize(precio)
		@precio=precio
		@puntaje_base=aplicar_bono(calcular_puntaje)
	end

	def calcular_puntaje
		aleatorio = rand(1..10)
		if aleatorio<4
			return 10
		elsif aleatorio < 8
			return 15
		else
			return 20
		end	
	end

	def aplicar_bono(puntaje)
		return puntaje*1
	end

	def aplicar_descuento
		#puts "Por cada 3 juegos, el 4to es gratis"
		@precio=0
	end

	def presentar_juego
		puts "================================"
		puts "======= JUGASTE UN JUEGO ======="
		mostrar_resumen
	end

	def mostrar_resumen
		puts "Obtuviste #{puntaje_base} puntos"
		puts "Se te cobró #{precio} soles"
		puts "================================"
	end
end


class Dota2 < Juego
	def initialize(precio)
		super(precio)
	end

	def aplicar_bono(puntaje)
		return puntaje*1.2
	end

	def presentar_juego
		puts "================================"
		puts "======= JUGASTE DOTA DOS ======="
		mostrar_resumen
	end
end


class Poker < Juego
	def initialize(precio)
		super(precio)
	end

	def aplicar_bono(puntaje)
		return puntaje*1.15
	end

	def presentar_juego
		puts "================================"
		puts "========= JUGASTE POKER ========"
		mostrar_resumen
	end
end


class Cars < Juego
	def initialize(precio)
		super(precio)
	end

	def aplicar_bono(puntaje)
		return puntaje*1.1
	end

	def presentar_juego
		puts "================================"
		puts "========= JUGASTE CARS ========="
		mostrar_resumen
	end
end


class Gamer
	attr_accessor :juegos, :codigo_gamer
	def initialize(codigo_gamer)
		@codigo_gamer=codigo_gamer
		@juegos = []
	end

	def jugar(game)
		if (juegos.count+1)%4==0 # cada 3 juegos -> el cuarto es gratuito
			game.aplicar_descuento
		end
		juegos.push(game)
	end


	def puntaje_total
		total = 0
		for juego in juegos
			total+=juego.puntaje_base
		end
		return total
	end

	def precio_total
		total = 0
		for juego in juegos
			total+=juego.precio
		end
		return total
	end
end


class Tienda
	attr_accessor :gamers
	def initialize
		@gamers = []
	end

	def registrar_jugador(jug)
		gamers.push(jug)
	end

	def obtener_ganador
		ganador = gamers.first
		max = ganador.puntaje_total
		for jug in gamers
			if jug.puntaje_total > max
				ganador = jug
				max = ganador.puntaje_total
			end
		end
		puts "============= GANADOR ============="
		puts "CODIGO   :  #{ganador.codigo_gamer}"
		puts "PUNTAJE  :  #{ganador.puntaje_total}"
		puts "==================================="
	end

	def mostrar_jugadores
		for jug in gamers
			puts "============= JUGADOR ============="
			puts "CODIGO   :  #{jug.codigo_gamer}"
			puts "PUNTAJE  :  #{jug.puntaje_total}"
			puts "JUGADOS  :  #{jug.juegos.count}"
			puts "INVERSION:  #{jug.precio_total}"
			puts "==================================="
			puts ""
		end
	end

	def partidas_gratuitas
		gratis = 0
		for jugador in gamers
			for juego in jugador.juegos
				if juego.precio==0
					gratis+=1
				end
			end
		end
		puts "Hubo #{gratis} juegos gratuitos"
	end
end

# se instancian los jugadores
puts ""
claudio = Gamer.new("12312312")
aldo = Gamer.new("45645645")

# se instancia la tienda de juegos
yachay = Tienda.new
# se registran los jugadores en la tienda
yachay.registrar_jugador(claudio)
yachay.registrar_jugador(aldo)

# simulacion de 9 juegos
claudio.jugar(Dota2.new(1))
claudio.jugar(Poker.new(1))
claudio.jugar(Cars.new(1))
claudio.jugar(Dota2.new(1))
claudio.jugar(Poker.new(1))
claudio.jugar(Cars.new(1))
claudio.jugar(Dota2.new(1))
claudio.jugar(Poker.new(1))
claudio.jugar(Cars.new(1))
# simulacion de 11 juegos
aldo.jugar(Dota2.new(1))
aldo.jugar(Poker.new(1))
aldo.jugar(Cars.new(1))
aldo.jugar(Dota2.new(1))
aldo.jugar(Poker.new(1))
aldo.jugar(Cars.new(1))
aldo.jugar(Dota2.new(1))
aldo.jugar(Poker.new(1))
aldo.jugar(Cars.new(1))
aldo.jugar(Dota2.new(1))
aldo.jugar(Poker.new(1))


yachay.mostrar_jugadores
yachay.obtener_ganador
yachay.partidas_gratuitas














