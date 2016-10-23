def saludo(nombre="Default", edad=0)
	return "Hola, tu nombre es #{nombre} y tu edad #{edad}"
end

puts "Llamada al metodo"
puts saludo("Claudio", 26)

puts "\nLlamada al metodo por default"
puts saludo()