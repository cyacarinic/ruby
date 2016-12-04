class Estudiante
  attr_accessor :nombre, :notas
  
  def initialize(nombre, notas)
    @nombre, @notas = nombre, notas
  end
  
  def calcular_total_notas
    total=0.0
    for i in 0..notas.size-1
      total+=notas[i]
    end
    total
  end
  
  def calcular_promedio
    calcular_total_notas / notas.size
  end 
  
end

class EstudianteView
  
  def presentar(estudiante)
  	puts "-------Reporte de promedios de alumno-------"
  	puts "Nombre :#{estudiante.nombre}"
  	puts "Promedio :#{estudiante.calcular_promedio}"
  	puts "-----------Notas del alumno-----------------"
  	estudiante.notas.each do |nota|
  		print nota.to_s + " "
  	end
  end
  
end

class EstudianteController
 
 def initialize(nombre, notas)
   @estudiante_model = Estudiante.new(nombre, notas)
   @estudiante_view  = EstudianteView.new
 end

 def procesar
   @estudiante_view.presentar(@estudiante_model)
 end

end

app = EstudianteController.new("carlos", [12, 16, 14])
app.procesar
