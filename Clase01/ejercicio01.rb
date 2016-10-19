class Boleta

	attr_accessor :monto
	def initialize(monto)
		@monto=monto
	end

	def calcular_igv
		return monto*0.18
	end

	def calcular_total
		return (monto+calcular_igv).round(2)
	end
end

boleta = Boleta.new(100)

puts "El total a pagar es #{boleta.calcular_total}"