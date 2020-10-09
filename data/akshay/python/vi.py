def task(msg):
	while 1:
		yield
		print(msg)


def scheduler(*tasks):
	while 1:
		for i in tasks:
			next(i)


scheduler(task("hello") , task("bye"))
