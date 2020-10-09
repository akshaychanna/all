# def generator_function():
#     for i in range(3):
#         yield i

# gen = generator_function()
# print(type(gen))
# # print(list(gen))
# print(next(gen))
# print(next(gen))



# valid = set(['yellow', 'red', 'blue', 'green', 'black'])
# print(valid)


# print("hey") if False else print("bye")

def my_gen():
    n = 1
    print('This is printed first')
    # Generator function contains yield statements
    yield n

    n += 1
    print('This is printed second')
    yield n

    n += 1
    print('This is printed at last')
    yield n
    
a = my_gen()
print(next(a))