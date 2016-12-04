require 'singleton'
class Mouse
	include Singleton
end

mouse1 = Mouse.instance
mouse2 = Mouse.instance

print mouse1 == mouse2
