import psycopg2
from functions.func import all_markets,search_by


while True:
  command = input(
    "Введите команду:\n\t'all'\n\t'search'\n\t'end' ==>\n\n")
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
    print("Неверная команда, попробуйте еще раз")