class Alumno
	attr_accessor :t1, :t2, :nombre, :codigo
	def initialize(t1, t2, nombre, codigo)
		@t1=t1
		@t2=t2
		@nombre=nombre
		@codigo=codigo
	end

	def calcular_situacion
		if t1>85 and t2>85
			return "APROBADO"
		else
			if t1>85 or t2>85
				return "OBSERVADO"
			else
				return "DESAPROBADO"
			end
		end
	end
end

alumno01 = Alumno.new(85, 85, "Milagros", "U201621489")
puts alumno01.calcular_situacion

alumno02 = Alumno.new(86, 85, "Erika", "U201621489")
puts alumno02.calcular_situacion

alumno03 = Alumno.new(86, 86, "Diana", "U201621489")
puts alumno03.calcular_situacion