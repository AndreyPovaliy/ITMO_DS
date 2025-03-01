var_row = [12,2,6,2,6,12,6,2,6,12,6,6,12,12,12,6,6,12,6,6]

var_row.sort()

# определить уникальные значения
items = set(var_row) # {2, 12, 6}
item_2 = 0
item_6 = 0
item_12 = 0

for item in var_row:
  if item == 2:
    item_2 +=1
  elif item == 6:
    item_6 +=1
  else:
    item_12 +=1

print(f"| '2' | '6' | '12' |\n|-----|-----|-----|\n|  {item_2}  |  {item_6}  |  {item_12}  |")
