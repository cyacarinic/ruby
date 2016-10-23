# Ingreso de datos por teclado
puts "Ingrese su nombre: "
nombre = gets
puts "Nombre ingresado = "+nombre

puts "Ingrese su apellido: "
apellido = gets
puts "Apellido ingresado = "+apellido

puts "--> Nombre completo = #{nombre} #{apellido}"	# imprime con salto de linea
puts "--> Nombre completo y seguido #{nombre.chomp} #{apellido.chomp}"

puts "Ingrese su edad"
edad = gets.chomp.to_i
puts "En 10 anios tendrás #{edad+10} anios"
puts "En 10 anios tendrás "+(edad+10).to_s+" anios"