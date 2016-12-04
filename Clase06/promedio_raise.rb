def promedio(nota1, nota2, nota3)
  raise ArgumentError, "La nota 1 debe estar entre 0 y 20 y se tuvo #{nota1}",
  caller if nota1<0 or nota1>20
  raise ArgumentError, "La nota 2 debe estar entre 0 y 20 y se tuvo #{nota2}",
  caller if nota2<0 or nota2>20
  raise ArgumentError, "La nota 3 debe estar entre 0 y 20 y se tuvo #{nota3}",
  caller if nota3<0 or nota3>20
  
  ((nota1+nota2+nota3)/3).round(2)
end

puts promedio(10.6, 12.5, -15.5)