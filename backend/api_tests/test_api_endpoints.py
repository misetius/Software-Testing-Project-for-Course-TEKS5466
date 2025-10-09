import requests
import pytest
import psycopg2
from util import *




def test_add_todo_list_for_user(headers, url):
    s = requests.session()
    data = '{"name":"Pick up groceries", "description":"remember to ask family"}'
    response = s.post(url+"api/todo-lists/",headers=headers, data=data)
    json = response.json()
    author = json["author"]["username"]
    description = json["description"]
    assert  author == "testuser1"
    assert description == "remember to ask family"



def test_get_todo_lists_of_users(headers, url):
    s = requests.session()
    response = s.get(url+"api/todo-lists/", headers=headers)
    json = response.json()
    author = json[0]["author"]["username"]
    description = json[0]["description"]
    assert  author == "testuser1"
    assert description == "remember to ask family"



def test_add_item_to_todolist(headers, url):

    data1 = '{"name":"tomato or tomato", "description":"tomato or tomato"}'
    data2 = '{"name":"potato or potato", "description":"potato or potato"}'

    response1 = add_items_to_todolist(headers, url, data1)
    response2 = add_items_to_todolist(headers, url, data2) 
    json1 = response1.json()
    json2 = response2.json()
    description1 = json1["description"]
    description2 = json2["description"]

    assert description1 == "tomato or tomato"
    assert description2 == "potato or potato"



def test_delete_todo_items_of_todo_list(headers, url):

    url2, response = get_todo_list_todo_items_in_it(headers, url)
    json = response.json()
    id1 = json[0]["id"]
    id2 = json[1]["id"]
    # Create Url items with the correct id
    urlid1 = url2 + "/" +str(id1)
    urlid2 = url2 + "/" + str(id2)
    # Create session for delete request
    s = requests.Session()

    response1 = s.delete(urlid1, headers=headers)
    response2 = s.delete(urlid2, headers=headers)
    response = s.get(url2, headers=headers)

    assert response1.text == "true"
    assert response2.text == "true"
    assert response.text == "[]"



def test_delete_todo_list_that_exists(headers, url):


    response = delete_todo_list(headers, url)
    emptyresponse = get_todo_lists(headers, url)


    assert response.text == "true"
    assert emptyresponse.text == "[]"



def test_add_item_to_todolist_fails_with_no_description(headers, url):

    todo_list_id = create_todo_list_and_return_todo_list_id(headers, url)

    url2 = url+"api/todo-lists/"
    url2 += f"{todo_list_id}/todos"
    empty_data = '{}'
    s = requests.session()

    response1 = s.post(url2, headers=headers, data=empty_data)
    json1 = response1.json()
    
  
    assert json1 == {'detail': "[{'type': 'missing', 'loc': ('body', 'description'), 'msg': 'Field required', 'input': {}}]"}
   