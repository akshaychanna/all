#Given an array 'a',create a product array where product[i]==produ    ct of all elements except a[i]




def product(a)
	length=a.length
	product_array=Array.new(length,1);
	total=1
	for j in 0...length
		count=0;
		for i in 0...length
			next if i==j
			total=total*a[i];
			product_array[j]=total
			#total=total*a[i];
			
		end
		count=count+1
		total=1;
	end
	return product_array
end
	


p product([1,2,3,4,5,6])

