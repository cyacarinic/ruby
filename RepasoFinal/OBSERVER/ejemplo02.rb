require 'Observer'

class Notificador	
end

class NotificadorSMS < Notificador
	def update(usuario)
		puts "Alerta SMS: Te queda poco saldo" if usuario.saldo < 500
	end
end


class NotificadorEmail < Notificador
	def update(usuario)
		puts "Alerta Mail: Te queda poco saldo" if usuario.saldo < 1000
	end
end


class Usuario
	include Observable
	attr_accessor :nombre, :saldo
	def initialize(nombre, saldo)
		@nombre, @saldo = nombre, saldo
		add_observer(NotificadorSMS.new)
		add_observer(NotificadorEmail.new)
	end

	def retiro(monto)
		@saldo-=monto
		changed
		notify_observers(self)
	end
end


puts ""
yo = Usuario.new("Claudio", 1748.50)
yo.retiro(300)
yo.retiro(100)
yo.retiro(38)
yo.retiro(164)
yo.retiro(200)
yo.retiro(800)

