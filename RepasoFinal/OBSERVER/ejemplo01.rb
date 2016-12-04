require 'Observer'

class Notificador
	def update(bici, km)
		puts "Usted ha recorrido #{km} kms en bici"
		puts "Su bicimoto debe ir a mantenimiento" if bici.km_tope <= bici.km_recorridos
	end

end

class Bici
	include Observable
	attr_accessor :km_recorridos, :km_tope
	def initialize(km_recorridos=0, tope=500)
		@km_recorridos, @km_tope = km_recorridos, tope
		add_observer(Notificador.new)
	end

	def log(km)
		@km_recorridos+=km
		changed
		notify_observers(self, km_recorridos)
	end
end

puts ""
bici = Bici.new(300, 500)
puts bici.log(100)
puts bici.log(100)
puts bici.log(100)