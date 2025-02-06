
def is_possible(n_a,n_b):
    if (n_a == 0 or n_a % 2 != 0) and (n_b == 0 or n_b % 2 != 0):
      print("NO")
    elif (n_a%6 == 0 or n_b*2%2 == 0) and (n_a%2 == 0 or n_b*2%6 == 0):
      print("YES")
    else:
       print("YES")
  



cycles = int(input("Enter number of cycles: "))

for i in range(1,cycles+1):
  n_first = int(input("Enter 1st number: "))
  n_second = int(input("Enter 2st number: "))
  print(f"Round №: {i}")
  print(n_first)
  print(n_second)
  is_possible(n_first,n_second)

