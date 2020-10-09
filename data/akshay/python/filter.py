ages = [5, 12,18, 17, 18, 24, 32]

def myFunc(x):
  if x < 18:
    return False
  else:
    return True

adults = filter(myFunc, ages)

for x in adults:
  print(x)
#print(type(adults))
#print(set(adults))
#print(list(adults))
