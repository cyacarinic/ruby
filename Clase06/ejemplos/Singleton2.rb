class Singleton
 @instance = nil
 @contador = nil
 
 def Singleton.createInstance
  @instance ||= new
 end

 def Singleton.getInstance
  @instance
 end


 def aumentarContador
  @contador = (@contador || 0) + 1
 end
 
 private_class_method :new
end


s1 = Singleton.createInstance
s2 = Singleton.createInstance
s3 = Singleton.getInstance

puts s1.aumentarContador
puts s2.aumentarContador
puts s3.aumentarContador
