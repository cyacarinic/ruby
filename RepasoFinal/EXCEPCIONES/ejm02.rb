def promedio(nota1, nota2, nota3)
	raise ArgumentError, "Nota 01 debe estar entre 0 y 20",
	caller if nota1<0 or nota1>20

	raise ArgumentError, "Nota 02 debe estar entre 0 y 20",
	caller if nota2<0 or nota2>20

	raise ArgumentError, "Nota 03 debe estar entre 0 y 20",
	caller if nota3<0 or nota3>20

	return ((nota1+nota2+nota3)/3).round(2)
end

puts ""
puts promedio(1,2,-3)