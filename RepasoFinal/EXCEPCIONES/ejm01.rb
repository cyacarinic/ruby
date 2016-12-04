def factorial(n)
	raise "Argumento incorrecto" if n<1
	return 1 if n==1
	n*factorial(n-1)
end

puts ""
#puts factorial(-16)
#puts factorial(0)
puts factorial(3)