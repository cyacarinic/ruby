class Poligono
	attr_accessor :base, :altura
	def initialize(base, altura)
		@base, @altura = base, altura
	end

	def calcular_area
		return 0.00
	end
end


class Rectangulo < Poligono
	attr_accessor :base, :altura
	def initialize(base, altura)
		super(base, altura)
	end

	def calcular_area
		return (base*altura).round(2)
	end
end


class Triangulo < Poligono
	attr_accessor :base, :altura
	def initialize(base, altura)
		super(base, altura)
	end

	def calcular_area
		return (base*altura/2.0).round(2)
	end
end


t01 = Triangulo.new(4, 3)
r01 = Rectangulo.new(4, 3)

'''
figuras = [t01, r01]
for figura in figuras
	puts figura.calcular_area
end
''' 

class Figura
	attr_accessor :figuras
	def initialize
		@figuras = []
	end

	def agregar_figura(fig)
		figuras.push(fig)
	end

	def listar_figuras
		for fig in figuras
			if fig.instance_of? Triangulo
				print "TRIANGULO: "
			else
				print "RECTANGULO: "
			end
			puts fig.calcular_area
		end
	end
end

figura = Figura.new()
figura.agregar_figura(t01)
figura.agregar_figura(r01)
figura.listar_figuras