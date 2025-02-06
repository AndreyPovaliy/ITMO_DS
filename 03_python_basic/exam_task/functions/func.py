import psycopg2

def all_markets():
  conn = psycopg2.connect(dbname="market_db", user="andreypovaliy", host="127.0.0.1", port="5432")
  cursor = conn.cursor()
  sql = 'SELECT * FROM "MarketDetails".markets;'
  cursor.execute(sql)
  print(cursor.fetchall())
  cursor.close()
  conn.close()

def sign_up():
  name = input("Введите имя: \n\t")
  surname = input("Введите фамилию: \n\t")
  username = input("Введите им пользователя: \n\t")
  password = input("Введите свой пароль: \n\t")
  return name,surname,username,password

def search_by(value):
  command = input("Из столбца:\n\t'state' \n\t'city' \n\t'index'\n\t ==>\n\n")
  if command == 'state':
    conn = psycopg2.connect(dbname="market_db", user="andreypovaliy", host="127.0.0.1", port="5432")
    cursor = conn.cursor()
    sql = f'SELECT * FROM "MarketDetails".markets WHERE state = {value};'
    cursor.execute(sql)
    print(cursor.fetchall())
    cursor.close()
    conn.close()
  elif command == 'city':
    conn = psycopg2.connect(dbname="market_db", user="andreypovaliy", host="127.0.0.1", port="5432")
    cursor = conn.cursor()
    sql = f'SELECT * FROM "MarketDetails".markets WHERE city = {value};'
    cursor.execute(sql)
    print(cursor.fetchall())
    cursor.close()
    conn.close() 
  elif command == 'index':
    conn = psycopg2.connect(dbname="market_db", user="andreypovaliy", host="127.0.0.1", port="5432")
    cursor = conn.cursor()
    sql = f'SELECT * FROM "MarketDetails".markets WHERE zip = {value};'
    cursor.execute(sql)
    print(cursor.fetchall())
    cursor.close()
    conn.close()
  else:
    print("Неверная команда")  

  

# def review():
#   row = sign_up()
#   conn = psycopg2.connect(dbname="market_db", user="andreypovaliy", host="127.0.0.1", port="5432")
#   cursor = conn.cursor()
#   sql1 = f'INSERT INTO "MarketDetails".users(user_id, fname, lname, username, password_hash) VALUES (?, {row[0]}, {row[1]}, {row[2]}, {row[3]});'
#   cursor.execute(sql1)
#   # реализация ввода отзыва
#   cursor.close()
#   conn.close()

