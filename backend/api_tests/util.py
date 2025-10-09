import requests

def add_items_to_todolist(headers, url, data):
    s = requests.session()
    response = s.get(url+"api/todo-lists/", headers=headers)
    json = response.json()
    todo_list_id = json[0]["id"]
    url2 = url+"api/todo-lists/"
    url2 += f"{todo_list_id}/todos"
    return s.post(url2, headers=headers, data=data)



def get_todo_list_todo_items_in_it(headers, url):
    s = requests.session()
    response = s.get(url+"api/todo-lists/", headers=headers)
    json = response.json()
    todo_list_id = json[0]["id"]
    url2 = url+"api/todo-lists/"
    url2 += f"{todo_list_id}/todos"
    return url2, s.get(url2, headers=headers)

def delete_todo_list(headers, url):
    s = requests.session()
    response = s.get(url+"api/todo-lists/", headers=headers)
    json = response.json()
    todo_list_id = json[0]["id"]
    url2 = url+"api/todo-lists/"
    url2 += f"{todo_list_id}"
    
    return s.delete(url2, headers=headers) 


def get_todo_lists(headers, url):
    s = requests.session()
    return s.get(url+"api/todo-lists/", headers=headers)


def create_todo_list_and_return_todo_list_id(headers, url):
    s = requests.session()
    data = '{"name":"Pick up groceries", "description":"remember to ask family"}'
    response = s.post(url+"api/todo-lists/",headers=headers, data=data)
    response = s.get(url+"api/todo-lists/", headers=headers)
    json = response.json()
    todo_list_id = json[0]["id"]
    return todo_list_id