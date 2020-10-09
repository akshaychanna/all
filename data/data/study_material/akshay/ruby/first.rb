require 'pry'
arr = [ 22,58,889,456,36,109]

data = arr.select{ |n|
	 n if n>100
}

puts data

