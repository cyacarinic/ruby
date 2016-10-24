class Aplicacion
	attr_accessor :dado1, :dado2
	def initialize()
		@dado1 = lanzar_dados
		@dado2 = lanzar_dados
		lanzar_dados
	end

	def lanzar_dados
		return rand(1..6).to_i
	end

	def calcular_resultado
		suma = dado1+dado2
		if suma == 7 or suma == 11
			return "GANAS"
		elsif suma == 2 or suma == 12
			return "PIERDES"
		else
			return "INDEFINIDO"
		end
	end
end

demo = Aplicacion.new
puts "\nDADO01 = #{demo.dado1}\nDADO02 =#{demo.dado2}"
puts "RESULTADO ==> #{demo.calcular_resultado}"