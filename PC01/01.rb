class RepresentanteFamiliar
	attr_accessor :dni, :nombre, :edad, :hijos_menores, :ingreso_fam_men, :m2_propiedad
	def initialize(dni, nombre, edad, hijos_menores, ingreso_fam_men, m2_propiedad)
		@dni = dni
		@nombre = nombre
		@edad = edad
		@hijos_menores = hijos_menores
		@ingreso_fam_men = ingreso_fam_men
		@m2_propiedad = m2_propiedad
	end

	def presentarse
		puts "================== DATOS DEL SOLICITANTE =================="
		puts "DNI             :: #{dni}"
		puts "NOMBRE          :: #{nombre}"
		puts "EDAD            :: #{edad}"
	end
end

class Financiera
	attr_accessor :nombre, :solicitantes
	def initialize(nombre)
		@nombre = nombre
		@solicitantes = []
	end

	def ingresar_solicitante(rep)
		solicitantes.push(rep)
	end

	def calcular_calificacion(rep)
		return (rep.edad+rep.hijos_menores+rep.ingreso_fam_men.to_f/(rep.m2_propiedad+1)).round(2)
	end

	def calcular_maximo(calif)
		#calif = calcular_calificacion(rep)
		if calif <= 200
			return 40000.00
		elsif calif > 200 and calif <= 400
			return 20000.00
		elsif calif > 400
			return 5000.00
		end
	end

	def evaluar_representante(rep)
		calificacion = calcular_calificacion(rep)
		monto_maximo = calcular_maximo(calificacion)
		rep.presentarse
		puts "CALIFICACION    :: #{calificacion}"
		puts "MONTO MAXIMO    :: #{monto_maximo}"
	end

	def listar_miembros
		for representante in solicitantes
			evaluar_representante(representante)
		end
	end

	def calcular_total
		total = 0
		for representante in solicitantes
			monto_maximo = calcular_maximo(calcular_calificacion(representante))
			total+=monto_maximo
		end
		puts "El total a desembolsar sería #{total}"
	end

	def buscar(dni)
		for representante in solicitantes
			if representante.dni == dni
				evaluar_representante(representante)
				break
			end
		end
		puts "DNI '#{dni}' NO ENCONTRADO"
	end
end



ggwp = Financiera.new("MicroBank")
ggwp.ingresar_solicitante(RepresentanteFamiliar.new("12345678", "Claudio Yacarini", 26, 0, 2500, 0))
ggwp.ingresar_solicitante(RepresentanteFamiliar.new("87654321", "Yvan Yacarini", 57, 2, 1500, 100))
ggwp.ingresar_solicitante(RepresentanteFamiliar.new("12312312", "Luz Chiroque", 56, 2, 1500, 100))
ggwp.ingresar_solicitante(RepresentanteFamiliar.new("01010101", "Fiama Yacarini", 22, 0, 0, 0))

ggwp.listar_miembros()
puts "\n\n\n"
ggwp.calcular_total()
puts "\n\n\n"
ggwp.buscar("12457898")
puts "\n\n\n"
ggwp.buscar("12312312")
puts "\n\n"
ggwp.buscar("01010101")
puts "\n\n"
ggwp.buscar("22222222")
puts "\n"

