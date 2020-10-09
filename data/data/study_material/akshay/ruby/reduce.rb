sum = 0
p [1, 2, 3].reduce() do |sum, n| 
sum + n 
p sum
end

p [1,2,3].reduce(:+)
puts sum
