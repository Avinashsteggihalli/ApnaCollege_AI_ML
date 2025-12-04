list = [i*i for i in range(6)]
print(list)


nums = [-2,-1,3,5,1,-1]
nums = [0 if val < 0 else val for val in nums]
print(nums)

words = ["hello", "apnaollge","avinash"]
words = [word.upper() for word in words]
print(words)