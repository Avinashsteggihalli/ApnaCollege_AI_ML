i = 0 # iterator
num = int(input("enter a number for multiplication table: "))
while (i <= 10):
    i += 1
    # if i == 6:
    #     break
    if i % 3 == 0:
        continue
    
    print(i*num)
