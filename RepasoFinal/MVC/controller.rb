class CtrEstudiante
	def initialize(nombre, notas)
		@mod_estudiante = ModeloEstudiante.new(nombre, notas)
		@vis_estudiante = VistaEstudiante.new
	end

	def procesar
		@vis_estudiante.presentar(@mod_estudiante)
	end
end
