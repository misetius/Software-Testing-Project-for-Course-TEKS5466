import psycopg2

def erase_databases():
    connection = psycopg2.connect(database="todo-app-dev", user='postgres', password='postgres', host="localhost", port=5431)
    cursor = connection.cursor()
    cursor.execute("TRUNCATE TABLE users, todo_list, todo_item CASCADE")
    connection.commit()
    connection.close()

def erase_todo_lists_and_items():
    connection = psycopg2.connect(database="todo-app-dev", user='postgres', password='postgres', host="localhost", port=5431)
    cursor = connection.cursor()
    cursor.execute("TRUNCATE TABLE todo_list, todo_item CASCADE")
    connection.commit()
    connection.close()

def erase_test_user():
    connection = psycopg2.connect(database="todo-app-dev", user='postgres', password='postgres', host="localhost", port=5431)
    cursor = connection.cursor()
    cursor.execute("DELETE FROM users WHERE username = 'testuser'")
    connection.commit()
    connection.close()