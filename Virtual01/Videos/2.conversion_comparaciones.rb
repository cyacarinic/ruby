=begin
Operadores:
	==	igual
	!=	diferente
	>	mayor
	>=	mayor o igual
	<	menor
	<=	menor o igual

Booleanos:
	true
	false
=end

# Mayusculas y minusculas
puts "Juan" == "juan"
puts "Juan" == 'Juan'

# Comparacion de numeros
puts 10 == 3+7

# Diferentes tipos de dato
puts "10" == 10

# Concatenacion
cadena1 = "Juan"
cadena2 = cadena1+" Perez"
puts cadena2

# Conversión de cadena a entero
# puts "10"+6	# ERROR
puts "10"+"6"
puts "10".to_i + 6
#puts 16+ " dieciséis" # ERROR
puts 16.to_s + " dieciséis"

# Conversion de cadena a real
puts 16.to_f