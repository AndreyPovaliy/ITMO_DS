import psycopg2
from functions.func import all_markets,search_by


while True:
  print("КОМАНДЫ: \n")
  print("'all' - все рынки \n")
  print("'search' - поиск по городу, штату, индексу \n")
  print("'end' - выход \n")
  command = input(
    "Введите команду:\n\t==>\n\n")
  if command == 'end':
    break
  elif command == 'all':
    result = all_markets()
    print(result)
  elif command == 'search':
    item = input("Введите значение:")
    result = search_by(item)
    print(result)
  else:
    print("\n\t(!!!)Неверная команда, попробуйте еще раз(!!!)\n")