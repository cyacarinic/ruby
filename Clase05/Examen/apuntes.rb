Envio
	codigo_envio
	volumen
	peso
	costo
	->calcular_costo
		costo=volumen*100 + peso*2
	->calcular_descuento
		if costo > 1000
			costo=costo*0.8
	->mostrar_detalle

Local (lima, callao) < Envio
	razon_social
	->calcular_costo
		costo=volumen*100 + peso*2

Provincial (fuera de lima y callao) < Envio
	codigo_contratante
	representante_legal
	codigo_provincia (de 2 a 24)
	->calcular_costo
		costo=volumen*100+peso*codigo_provincia
	
Empresa
	-> regisrar_envio
	-> calcular_costo_envios
	-> datos_envio_mas_caro