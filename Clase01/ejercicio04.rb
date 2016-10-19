class Alumno
	attr_accessor :t1, :t2, :nombre, :codigo
	def initialize(t1, t2, nombre, codigo)
		@t1=t1
		@t2=t2
		@nombre=nombre
		@codigo=codigo
	end

	def calcular_situacion
		if t1>85
			if t2 >85
				return "APROBADO"
			else
				return "OBSERVADO"
			end
		else
			if t2 >85
				return "OBSERVADO"
			else
				return "DESAPROBADO"
			end
		end
	end
end

alumno = Alumno.new(85, 86, "Claudio", "U201621489")
puts alumno.calcular_situacion