arreglo_variado = ["Juan", 3, 5.1, [1, 2], "cadena mas larga"]

arreglo_enteros = [1, 2, 3 ,4 ,5]

cadena = arreglo_variado.to_s

puts arreglo_variado
puts cadena
puts "arreglo de enteros #{arreglo_enteros}"

puts "For each"
arreglo_variado.each do |elemento| 
	puts "Elemento: #{elemento}"
	puts "El triple: #{elemento*3}"
	puts "--"
end

for i in arreglo_enteros do
	puts "EL doble == #{i*2}"
	puts "--"
end

puts "primero #{arreglo_enteros.first}"
puts "primero por indice #{arreglo_enteros[0]}"
puts "Ultimo #{arreglo_enteros.last}"
puts "Tambien ultimo #{arreglo_enteros[-1]}"

puts "POP ARREGLO DE ENTEROS #{arreglo_enteros.pop}"
puts "ARREGLO DE ENTEROS #{arreglo_enteros}"

puts "PUSH ARREGLO DE ENTEROS #{arreglo_enteros.push(6)}"
puts "<< ARREGLO DE ENTEROS #{arreglo_enteros << 7}"

arreglo_enteros.delete_at(3)
puts "DELETE AT ARREGLO DE ENTEROS #{arreglo_enteros}"

arreglo_enteros.delete(6)
puts "DELETE 6 EN ARREGLO DE ENTEROS #{arreglo_enteros}"

puts "UNSHIFT INSERTA 11 AL INICIO #{arreglo_enteros.unshift(11)}"
puts "UNSHIFT INSERTA 16 AL INICIO #{arreglo_enteros.unshift(16)}"

puts "SORT ORDENA ARREGLO #{arreglo_enteros.sort} TEMPORALMENTE"
puts "#{arreglo_enteros}"
puts "SORT! ORDENA PERMANTENTEMENTE #{arreglo_enteros.sort!}"
puts "#{arreglo_enteros}"