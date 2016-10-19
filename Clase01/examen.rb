class Examen
	attr_accessor :curso, :profesor, :alumno, :nota # no es necesario el @ para llamar en metodos
	#attr_reader :curso, :profesor, :alumno, :nota  # Solo lectura
	#attr_writer :curso, :profesor, :alumno, :nota  # Solo escritura

	def initialize(curso, profesor, alumno, nota)
		@curso=curso
		@profesor=profesor
		@alumno=alumno
		@nota=nota
	end 

	def consultar_curso
		return "El examen es del curso #{curso}"
	end

	def consultar_docente
		return "El docente del curso #{@curso} es #{@docente}"
	end

	def consultar_alumno
		return "El alumno que rindió el examen fue #{@alumno}"
	end

	def consultar_nota
		return "La nota del alumno es #{@nota}"
	end

	def consultar_situacion
		if nota >= 13
			return "La situacion del alumno es APROBATORIA"
		else
			return "La situacion del alumno es DESAPROBATORIA"
		end
	end
end

ex01 = Examen.new("POO", "Elias Montero", "Claudio Yacarini", 15)
ex02 = Examen.new("POO", "Elias Montero", "Juan Perez", 10)


puts "============================"
puts ex01.consultar_curso
puts ex01.consultar_docente
puts ex01.consultar_alumno
puts ex01.consultar_nota
puts ex01.consultar_situacion
puts "============================"
puts ex02.consultar_curso
puts ex02.consultar_docente
puts ex02.consultar_alumno
puts ex02.consultar_nota
puts ex02.consultar_situacion
puts "============================"