class First:
	val = 5
	def __init__(self):
		self.abc = 6
	def function(self,x,y):
		return self.abc*x*y

class Second(First):
	def __init__(self):
	 	self.abc = 7
	# def function(self,x,y):
	# 	return self.abc*x*y



i1 = First()
print(i1.function(2,3))
i2 = Second()
print(i2.function(2,3))