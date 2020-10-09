class Gadget
	attr_accessor :uname
	attr_writer :pass
	attr_accessor :year
	attr_accessor :age

## class variable
	@@age = 31


###public class
	def initialize(uname,pass)
		@uname = uname    ## instance variable
		@pass = pass      ## instance variable
		@@age += 1        ## instance variable
	end

	def fun 
		puts "this is public method"
		puts @@age
	end

	def fun2(abc)
		puts "this is protected method"
		puts self.uname
		puts abc.uname
	end

### class method,,can call directly on class name even if object is not present
def self.intro
	puts "this is class methos"
end

## private methods called inside class only..
	private
	def fun1
		puts "this is private method"
	end
end



Gadget.intro
laptop = Gadget.new("akshay","secrate")
#pc = Gadget.new("amar","kat")


laptop.fun
puts "___________________________"
pc = Gadget.new("amar","kat")
pc.fun
#puts laptop.uname
#laptop.fun
#laptop.fun1

#laptop.fun2(pc)

