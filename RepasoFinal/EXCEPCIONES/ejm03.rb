def factorial(n)
	raise TypeError, "Se esperaba un valor entero" if not n.is_a? Integer
	raise ArgumentError, "Argumento incorrecto, valor debe ser mayor que cero (recibido =#{n} )",
	caller if n<1
	return 1 if n==1
	n*factorial(n-1)
end


puts ""
begin
	x=factorial('4'.to_i)
	puts x
rescue ArgumentError=>ex
	puts "#{ex.class}: #{ex.message}"
rescue TypeError=>ex
	puts "#{ex.class}: #{ex.message}"
end