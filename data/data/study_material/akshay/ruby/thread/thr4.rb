arr = [ 23,45,67,89]
threads = []

for i in arr
	Thread.new(i) do |n|
	process_them(n)
	end
	threads.join {|d| d.join}


	def process_them(n)
		puts n
		return n
	end



end