class Notificador
  def update(bike, km)
    puts "Su eBike ha acumulado #{km} km, para un total de #{bike.kilometraje} km de viaje."
    puts "Su eBike requiere ir al servicio de mantenimiento!" if bike.servicio <= bike.kilometraje
  end
end

require 'observer'
 
class Ebike
  include Observable
 
  attr_accessor :kilometraje, :servicio
 
  def initialize(kilometraje, servicio)
    @kilometraje, @servicio = kilometraje, servicio
    add_observer(Notificador.new)
  end
 
  def log(km)
    @kilometraje += km
    changed
    notify_observers(self, km)
  end
end
puts ""
eBike = Ebike.new(300, 500)
eBike.log(100)
eBike.log(300)
