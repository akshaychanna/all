import pdb

class First:
	val = 4
	def __init__(self):
		self.abc = 7
	def my_func(self,x,y):
		return self.abc*x*y


inst1 = First()
inst2 = First()
pdb.set_trace()

