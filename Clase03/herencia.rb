class Mamifero
	def respirar
		puts "Inspirar, Espirar..."
	end
end

class Gato < Mamifero
	def maullar
		puts "Miaaaaau"
	end
end


michi = Gato.new
michi.respirar
michi.maullar