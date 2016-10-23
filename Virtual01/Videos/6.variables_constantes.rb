# Programa principal

IGV = 0.18 # Constante: No varia durante la ejecucion del programa
$resultado = "El precio final es: "

def calcular_precio_uno(precio_bruto)
	$saludo = "Hola" # Variable global
	impuesto = precio_bruto*IGV
	final = precio_bruto+impuesto
	return final
end


puts calcular_precio_uno(100)
puts $saludo

def calcular_precio_dos(precio_bruto)
	impuesto = precio_bruto*IGV
	final = precio_bruto+impuesto
	$resultado += final.to_s
end

calcular_precio_dos(100)
puts "Segun metodo 2, "+$resultado