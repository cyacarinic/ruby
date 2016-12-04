require 'singleton'

class Mouse 
	include Singleton
end

m01 = Mouse.instance
m02 = Mouse.instance

puts ""
puts m01 == m02