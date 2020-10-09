str="Hello GUYS , welcome to RUBY!"
puts str
puts str[2,7] #from 2nd positon to next 7 chars
puts str[2..14] #from 2nd char to 7th char
str[0..4]="hi"
puts str
puts

puts "capitalize"
puts str.capitalize!
puts

puts "str:"
puts "str is #{str}"
puts

puts "down"
puts str.downcase
puts

puts "upper"
puts str.upcase
puts

puts "swapping u to L and L to U"
puts str.swapcase
puts

puts "reverse"
puts str.reverse
puts

puts "include?"
puts str.include?("w")

abc=""
puts abc.nil?
puts abc.empty?

#run time input

print "enter your name:"
name=gets
puts "hello #{name}, How are you ?"




