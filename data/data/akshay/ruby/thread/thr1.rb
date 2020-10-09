#How to Use Ruby Threads_ An Easy To Understand Tutorial

t = Thread.new { puts 10**10 }
puts "hello"
t.join
