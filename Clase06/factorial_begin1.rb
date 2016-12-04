def factorial(n)
  raise TypeError, "Se esperaba un valor entero" if not n.is_a? Integer
  raise ArgumentError, "Argumento incorrecto, se esperaba valor mayor a 0 y se recibe #{n}", caller if n<1
  
  return 1 if n == 1
  n*factorial(n-1)
end

begin
  x = factorial(1.3)
  puts x
rescue => ex
  puts "#{ex.class}: #{ex.message}"
end