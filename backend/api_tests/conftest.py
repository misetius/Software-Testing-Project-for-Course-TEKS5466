import pytest
import psycopg2
import requests
from passlib.context import CryptContext

@pytest.fixture(scope='session', autouse=True)
def create_user_account():
    pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
    testuser = "testuser1"
    password = "password"
    crypted_password = pwd_context.hash(password)
    data = (testuser, crypted_password)


    query = """
INSERT INTO users (username, password)
VALUES (%s, %s);
"""

    connection = psycopg2.connect(database="todo-app-dev", user='postgres', password='postgres', host="localhost", port=5431)
    cursor = connection.cursor()
    cursor.execute(query, data)
    connection.commit()
    connection.close()


@pytest.fixture(scope='session', autouse=True)
def headers():
    data = '{"username":"testuser1", "password":"password"}'
    url = "http://localhost:4322/"
    s = requests.session()
    response = s.post(url+"api/users/login", data=data)
    response = response.json()
    accesstoken = response["accessToken"]
    headers = {"Authorization": f"Bearer {accesstoken}"}
    return headers



@pytest.fixture(scope='session',autouse=True)
def url():
    url = "http://localhost:4322/"
    return url

@pytest.hookimpl()
def pytest_sessionfinish():
    connection = psycopg2.connect(database="todo-app-dev", user='postgres', password='postgres', host="localhost", port=5431)
    cursor = connection.cursor()
    cursor.execute("TRUNCATE TABLE users, todo_list, todo_item, todo_list_role, todo_list_member, todo_item_assignee, todo_item_comment, tag_category, tag, todo_item_tag, todo_list_tag")
    connection.commit()
    connection.close()