# # we can create our own function , but in small scale or general use
# sum = lambda a,b,c: a+b+c
# avg = lambda a,b: (a+b)/2
# print(sum(2, 3, 10))
# print(avg(12, 50))

# factorial of n number
def fact(num):
    mul = 1
    for i in range(1,num+1):
        mul *= i
    result = "fact of", num, "is: ", mul,
    return result

val = fact(4)
print(val)