class Alumno
	attr_accessor :codigo, :nombre, :apellidos, :pc1, :pc2, :participacion, :final
	def initialize(codigo, nombre, apellidos, pc1, pc2, participacion, final)
		@codigo = codigo
		@nombre = nombre
		@apellidos = apellidos
		@pc1 = pc1
		@pc2 = pc2
		@participacion = participacion
		@final = final
	end

	def presentarse
		return "El alumno #{nombre} con código #{codigo} asistió a Clase"
	end

	def calcular_nota
		return (pc1*0.2 + pc2*0.25+participacion*0.25+final*0.30).round(2)
	end

	def determinar_situacion
		if calcular_nota < 13
			return "El alumno #{nombre} está DESAPROBADO con #{calcular_nota}"
		else
			return "El alumno #{nombre} está APROBADO con #{calcular_nota}"
		end
	end
end

alumno = Alumno.new("U201621489", "Claudio", "Yacarini", 13, 13, 13, 13)
puts alumno.determinar_situacion