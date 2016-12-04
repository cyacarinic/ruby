class ModeloEstudiante
	attr_accessor :nombre, :notas
	def initialize(nombre, notas)
		@nombre, @notas = nombre, notas
	end

	def calcular_notas
		total=0
		for nota in notas
			total+=nota
		end
		return total
	end

	def calcular_promedio
		return calcular_notas/notas.size
	end
end