def distinct(a)
	a.sort!
	new_arr=[]
	for i in 0...a.length
		new_arr << a[i] if a[i]!=a[i+1]
	end	
	return new_arr
end









a=[1,1,1,1,2,2,2,2,3,3,3,3,4,51,2,31,1,1,23,3,4]
p distinct(a)
p a

b=[4,7,4,1,1,4,8,10,6,7]
p b
p distinct(b)

