class Triangulo
	attr_accessor :lado_a, :lado_b, :lado_c
	def initialize()
		@lado_a = ingresar_lado("A")
		@lado_b = ingresar_lado("B")
		@lado_c = ingresar_lado("C")
	end

	def ingresar_lado(nombre)
		puts "Ingrese lado #{nombre}"
		lado = gets.to_f
		until lado > 0
			puts "Ingrese lado #{nombre} (número mayor que cero)"
			lado = gets.to_f		
		end
		return lado
	end

	def calcular_perimetro
		return lado_a+lado_b+lado_c
	end

	def calcular_area
		semi = (calcular_perimetro/2.0)
		prod = (semi)*(semi-lado_a)*(semi-lado_b)*(semi-lado_c)
		if prod > 0
			raiz = Math.sqrt(prod)
		else
			puts "\tADVERTENCIA: El producto de las diferencias es #{prod}"
			raiz = 0
		end		
		return raiz.round(2)
	end

end


triangulo = Triangulo.new()
puts "====== AREA DEL TRIANGULO ======"
puts "El perímetro del triángulo es #{triangulo.calcular_perimetro}"
puts "El semi-perímetro del triángulo es #{triangulo.calcular_perimetro/2}"
puts "El área del triángulo es #{triangulo.calcular_area}"
