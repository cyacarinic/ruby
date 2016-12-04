def factorial(n)
  raise "argumento incorrecto" if n <1
  return 1 if n ==1 
  n * factorial(n-1)
end

puts factorial(0)