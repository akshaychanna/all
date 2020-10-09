try:
	10/0
except ZeroDivisionError:
	print("oops,error")
else:
	pass
finally:
	print("done....")


try:
	10/0
except ZeroDivisionError:
	print("error")
else:
	pass
finally:
	print("DONE>>>!!")