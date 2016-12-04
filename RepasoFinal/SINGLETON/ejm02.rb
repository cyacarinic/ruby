class Singleton
	@instance=nil
	@contador=nil

	def Singleton.createinstance
		@instance||=new
	end

	def Singleton.getinstance
		return @instance
	end

	def aumentarcontador
		@contador=(@contador||0)+1
	end

	private_class_method :new
end

s1 = Singleton.createinstance
s2 = Singleton.createinstance
s3 = Singleton.getinstance

puts
puts s1.aumentarcontador
puts s2.aumentarcontador
puts s3.aumentarcontador