# count number of vowels in word
word = 'Artificial Man'
vowels = 'aeiouAEIOU'
count = 0
for j in word:
    if j in vowels:
        count += 1
print(count)