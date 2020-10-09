def max_sum(a)
	sum=0
	val=0
	length=a.length
	a[length]=0
	for i in 0...length
		val=a[i]+a[i+1] 
		sum=val if val>sum
	end	
	return sum
end

p max_sum([1,2,3,-1,4,5,0])
