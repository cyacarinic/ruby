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

class AdministradorModel
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
end

class AdministradorController
	def initialize()
		@administradormodel=AdministradorModel.new()
		@administradorview=AdministradorView.new
	end
	def adicionarfiguras(figura)
		@administradormodel.agregarfiguras(figura)
	end
	def buscarmayor
		@administradorview.mayorarea(@administradormodel)
	end
	def cantidadfiguras
		@administradorview.cantidadfiguras(@administradormodel)
	end
	def sumaareas
		@administradorview.sumaareas(@administradormodel)
	end
	def listarareas
		@administradorview.listarareas(@administradormodel)
	end
end


class AdministradorView
	def presentar(administrador)
		puts "La cantidad de figuras geometricas es="+administrador.calcularcantidadfiguras.to_s
	end
	def mayorarea(model)
		puts "La Figura de mayor area es:"+model.mayorarea.tipo
		puts "El area de la figura es:"+model.mayorarea.calcularArea.to_s		
	end
	def cantidadfiguras(model)
		puts "La cantidad de figuras es: "+model.calcularcantidadfiguras.to_s
	end
	def sumaareas(model)
		puts "La suma de las areas es: "+model.calculartotalareas.to_s
	end
	def listarareas(model)
		ajuste = 30
		puts "Detalle de figuras"
		puts "___________________________________"
		nroItem = 0
		print "| Nro".ljust(2)
		print "| tipo".ljust(10)
		print "| area".ljust(20) + "|\n"
		puts "___________________________________"
		for i in 0..model.figuras.size-1
			f=model.figuras[i]
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


app= AdministradorController.new

# 1.
figura1=Triangulo.new("Triangulo",23.7,5.1)
figura2=Circulo.new("Circulo",5.3)
figura3=Cuadrado.new("Cuadrado",34.7)
figura4=Triangulo.new("Triangulo",12.3,6.1)
figura5=Cuadrado.new("Cuadrado",24.1)

app.adicionarfiguras(figura1)
app.adicionarfiguras(figura2)
app.adicionarfiguras(figura3)
app.adicionarfiguras(figura4)
app.adicionarfiguras(figura5)

#2.
#puts "La cantidad de figuras geometricas es="+
app.cantidadfiguras
#3.
#puts "La suma de las areas es="+administrador.calculartotalareas.to_s
app.sumaareas
#4.
#mayor=administrador.mayorarea
#puts "La Figura de mayor area es:"+mayor.tipo
#puts "El area de la figura es:"+mayor.calcularArea.to_s
app.buscarmayor

app.listarareas