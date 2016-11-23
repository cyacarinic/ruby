class Figura
	attr_accessor :tipo
	def initialize(tipo)
		@tipo=tipo
	end
end

class Triangulo < Figura
	attr_accessor :base,:altura
	def initialize(tipo,base,altura)
		super(tipo)
		@base=base
		@altura=altura
	end	
	def calcularArea
		(base*altura/2).round(2)
	end
end 

class Circulo < Figura
	attr_accessor :radio
	def initialize(tipo,radio)
		super(tipo)
		@radio=radio		
	end	
	def calcularArea
		(3.14159*radio*radio).round(2)
	end

end

class Cuadrado < Figura
	attr_accessor :lado
	def initialize(tipo,lado)
		super(tipo)
		@lado=lado		
	end	
	def calcularArea
		(lado*lado).round(2)
	end
end

class Administrador
	attr_accessor :figuras
	def initialize
		@figuras=Array.new
	end
	def agregarfiguras(figura)
		figuras.push(figura)
	end
	def calcularcantidadfiguras
		figuras.size
	end
	def calculartotalareas 
		total=0.0
		figuras.each do |figura|
			total+=figura.calcularArea
		end
		total.round(2)
	end
	def mayorarea
		mayor=0.0
		for i in 0..figuras.size-1
			area=figuras[i].calcularArea
			if area>mayor
				mayor=area
				figura=figuras[i]
			end
		end
		figura
	end
	def listarareas
		ajuste = 30
		puts "Detalle de figuras"
		puts "___________________________________"
		nroItem = 0
		print "| Nro".ljust(2)
		print "| tipo".ljust(10)
		print "| area".ljust(20) + "|\n"
		puts "___________________________________"
		for i in 0..figuras.size-1
			f=figuras[i]
			nroItem+=1
			print "| " + nroItem.to_s.ljust(2)
			print "| #{f.tipo}".ljust(15)
			print "| #{f.calcularArea}".ljust(15) + "|\n" 
		end
		puts "_________________________________________________________________________________________________________"
		puts ""
		puts ""
	end	
end

# 1.
figura1=Triangulo.new("Triangulo",23.7,5.1)
figura2=Circulo.new("Circulo",5.3)
figura3=Cuadrado.new("Cuadrado",34.7)
figura4=Triangulo.new("Triangulo",12.3,6.1)
figura5=Cuadrado.new("Cuadrado",24.1)

adm=Administrador.new
adm.agregarfiguras(figura1)
adm.agregarfiguras(figura2)
adm.agregarfiguras(figura3)
adm.agregarfiguras(figura4)
adm.agregarfiguras(figura5)

#2.
puts "La cantidad de figuras geometricas es="+adm.calcularcantidadfiguras.to_s

#3.
puts "La suma de las areas es="+adm.calculartotalareas.to_s

#4.
mayor=adm.mayorarea
puts "La Figura de mayor area es:"+mayor.tipo
puts "El area de la figura es:"+mayor.calcularArea.to_s

#5.
adm.listarareas
