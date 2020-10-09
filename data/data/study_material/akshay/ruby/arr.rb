arr=[5,7,8,9,4,5,33,55,77,88,9,6,5]
puts arr.select { |n| n if n>20}

str="heyy Hiii.. i am akshay channa"
puts "this is str reverse #{str[0..4].reverse} done"
puts arr.count
p str.reverse

p "_______________"
p str.length


#array opertions

p arr[0].even?
p arr[0].odd?
p arr[0].between?(1,10)


p -34.23.abs
p 34.23.ceil
p 34.23.floor
p 34.2322.round(3)

5.times { p "hello"}

1.upto(4){|n| puts n}
puts
5.downto(1){|n| puts n}
puts "heyyyy..........."

0.step(10,2){ |n| puts n}


#multi line string
str = <<ab
akshay
channa from solapur
ab

puts str


#concat

s1="akshay"
s2="channa"

p s1.concat(s2," from solapur" )
puts "woohhhh"
puts s1
#puts s1 << s2


puts s1.length


