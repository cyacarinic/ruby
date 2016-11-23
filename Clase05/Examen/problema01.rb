class Envio
	attr_accessor :codigo_envio, :volumen, :peso, :costo
	def initialize(codigo_envio, volumen, peso)
		@codigo_envio, @volumen, @peso= codigo_envio, volumen, peso
		@costo=calcular_costo
	end

	def calcular_costo
		return calcular_descuento(volumen*100.0 + peso*2.0).round(2)
	end

	def calcular_descuento(precio)
		if precio > 1000
			return precio*0.8
		else
			return precio
		end
	end

	def mostrar_detalle
		detalle = "CODIGO DE ENVÍO  = #{codigo_envio}\nVOLUMEN MÉTRICO  = #{volumen}\n"
		detalle+= "PESO             = #{peso}\nCOSTO            = #{costo}"
		return detalle
	end
end


class EnvioLocal < Envio
	attr_accessor :razon_social
	def initialize(codigo_envio, volumen, peso, razon_social)
		super(codigo_envio, volumen, peso)
		@razon_social=razon_social
	end

	def mostrar_detalle
		detalle = super
		detalle+= "\nRAZON SOCIAL     = #{razon_social}"
		return detalle
	end

end


class EnvioProvincial < Envio
	attr_accessor :codigo_contratante, :representante_legal, :codigo_provincia
	def initialize(codigo_envio, volumen, peso, codigo_contratante, representante_legal, codigo_provincia)
		@codigo_contratante, @representante_legal, @codigo_provincia = codigo_contratante, representante_legal, codigo_provincia
		super(codigo_envio, volumen, peso)
	end

	def calcular_costo
		return calcular_descuento( volumen*100+peso*codigo_provincia ).round(2)
	end

	def mostrar_detalle
		detalle = super
		detalle+= "\nCOD CONTRATANTE  = #{codigo_contratante}"
		detalle+= "\nREP LEGAL        = #{representante_legal}"
		detalle+= "\nCODIGO PROVINCIA = #{codigo_provincia}"
		return detalle
	end
end


class Empresa
	attr_accessor :nombre, :envios
	def initialize(nombre)
		@nombre=nombre
		@envios=[]
	end

	def registrar_envio(env)
		envios.push(env)
	end

	def calcular_costo_envios
		total=0.0
		for envio in envios
			total+=envio.costo
		end
		return total.round(2)
	end

	def calcular_envio_mas_caro
		envio_caro=envios.first
		costo_caro=envio_caro.costo
		for envio in envios
			if envio.costo > costo_caro
				envio_caro=envio
				costo_caro=envio_caro.costo
			end
		end
		envio_caro.mostrar_detalle
	end
end


''' TEST
puts "\n\n"
puts EnvioLocal.new("123123", 150, 30, "yiyi wp").mostrar_detalle
puts "\n\n"
puts EnvioProvincial.new("123123", 150, 30, "lol", "ursa", 15.0).mostrar_detalle
'''

# SE ISNTANCIA LA EMPRESA
courier = Empresa.new("Transilvania S.A.")

# SE INSTANCIAN 05 ENVIOS
envio01 = EnvioLocal.new("123123", 150, 30, "Yachay")
envio02 = EnvioProvincial.new("456456", 200, 40, "Pukutay", "Claudio Yacarini", 15)
envio03 = EnvioLocal.new("789789", 70, 14, "Nakuy")
envio04 = EnvioProvincial.new("741741", 20, 4, "Colca", "ursa", 5)
envio05 = EnvioLocal.new("852852", 95, 19, "Qullqa")

# SE REGISTRAN 5 ENVIOS
courier.registrar_envio(envio01)
courier.registrar_envio(envio02)
courier.registrar_envio(envio03)
courier.registrar_envio(envio04)
courier.registrar_envio(envio05)

# SE CALCULA EL COSTO TOTAL
puts "EL COSTO TOTAL ES DE #{courier.calcular_costo_envios} SOLES "
puts "\n"

# SE CALCULA EL ENVIO MAS CARO
puts "================== DATOS DEL ENVIO MAS CARO =================="
puts courier.calcular_envio_mas_caro