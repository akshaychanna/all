require 'pry'
a=[9,22,55,66]
h={name:"akshay","age":25}

#puts a
#puts 
#p h

a<<h

#p a.class

#ew=a.select{|n| n if n>10 and n.is_a?(Integer)} 
#p new

a.each do |n|
	p n
	binding.pry
end

puts

#puts a[4]

#new=a.select do |n|
#	n if n.is_a?(Integer) and n>10
#end

#p new
