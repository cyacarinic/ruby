=begin	
operadores logicos
	&& and
	|| or
	! not	
=end


puts "Numero aleatorio"
num1 = rand(1..10)
puts num1

if num1>4 and num1<6
	puts "El numero es cinco"
else
	puts "El numero no es cinco"
end

if num1>4 && num1<8
	puts "El numero está entre 4 y 8"
else
	puts "El numero no está entre 4 y 8"
end

# if en una linea
if num1 <=5 then puts "El numero es menor o igual que 5" end

# if al final
puts "El numero es mayor o igual a 5" if num1>=5

# CASE
puts "Numero aleatorio 2"
num2 = rand(1..10)
puts num2

case num2
	when 1
		puts "El numero es uno"
	when 2
		puts "El numero es dos"
	when 3
		puts "El numero es tres"
	when 4
		puts "El numero es cuatro"
	when 5
		puts "El numero es cinco"
	else
		puts "El numero es mayor que 5"
end