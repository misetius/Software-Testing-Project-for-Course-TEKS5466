*** Settings ***
Library    Browser
Library    script.py
Test Tags    smoke


*** Variables ***


${URL} =    http://localhost:4321
${USERNAME} =    testuser
${PASSWORD} =    password
${SECONDUSERNAME} =    usertest




*** Test Cases ***

Registering Should Be Possible
    [Tags]    test:retry(10)    -smoke
    Register
    Get Text    body    contains    first

 

Valid Logout And Login
    [Tags]    test:retry(10)    -smoke
    Erase_databases
    Register
    Get Url    ==    http://localhost:4321/todo-lists
    Click    text="Logout"
    Get Url    ==    http://localhost:4321/login 
    Get Text    body    contains    Welcome
    Login
    Get Text    body    contains    first
    Get Url    ==    http://localhost:4321/todo-lists

Create and delete Todos
    [Tags]    test:retry(10)    -smoke
    Erase_databases
    Register
    Create Two Todo Lists
    Get Text    body    contains    "Pick up the groceries" 
    Get Text    body    contains    "Pick up the keys"
    Delete Two Todo Lists      
    Get Text    body    contains    first
    

Modify todo list
    [Tags]    test:retry(10)
    Erase_databases
    Register
    Create Two Todo Lists
    Get Text    body    contains    "Pick up the groceries" 
    Get Text    body    contains    "Pick up the keys"
    Change Values Of Todo List
    Get Text    body    contains    gym
    Get Text    body    contains    Chest
    Delete Modified Lists
    Get Text    body    contains    first

Create Items And Delete Items
    [Tags]    test:retry(10)    -smoke
    Erase_databases
    Register
    Create One Todo
    Open Todo
    Create Todo Items
    Get Text    body    contains    Tomato
    Get Text    body    contains    Potato
    Delete Todo Items
    Get Text    body    not contains    Potato
    Go Back To Home Page
    Delete Todo List

Create Items And Modify Items
    [Tags]    test:retry(10)
    Erase_databases
    Register
    Create One Todo
    Open Todo
    Create Todo Items
    Get Text    body    contains    Tomato
    Get Text    body    contains    Potato
    Modify Todo Item
    Get Text    body    contains    Caramel
    Go Back To Home Page
    Delete Todo List

Create Items And Mark Them As Completed
    [Tags]    test:retry(10)
    Erase_databases
    Register
    Create One Todo
    Open Todo
    Create Todo Items
    Get Text    body    contains    Tomato
    Get Text    body    contains    Potato 
    Mark Todo Item As Completed
    Go Back To Home Page
    Get Text    body    contains    1/2
    Delete Todo List 

Register Another User
    [Tags]    test:retry(10)
    Erase_databases
    Register Second Account
    

Sharing Todo Lists To Another User
    [Tags]    test:retry(10)
    erase_todo_lists_and_items
    erase_test_user
    Register
    Create One Todo
    Open Todo
    Create Todo Items
    Get Text    body    contains    Tomato
    Get Text    body    contains    Potato 
    Share Todo List
    Get Text    body    contains    Members
    

Get Shared Todolist
    [Tags]    test:retry(10)
    Login Second
    Get Text    body    contains    Shared
    Click    //html/body/main/astro-island/div/div[5]/div/div/a 
    Get Text    body    contains    Members
    Get Text    body    contains    Tomato






Erasing
    Erase_databases





*** Keywords ***

Share Todo List
    Click    //html/body/nav/div/div/astro-island/div/button
    Click    //html/body/nav/div/div/astro-island/div/dialog/div/form/div[1]/div[1]/div/div/input
    Type Text    //html/body/nav/div/div/astro-island/div/dialog/div/form/div[1]/div[1]/div/div/input    ${SECONDUSERNAME}    delay=100 ms
    Keyboard Key    press    Enter
    Click    //html/body/nav/div/div/astro-island/div/dialog/div/form/div[4]/button[2]

Mark Todo Item As Completed
    Click    //html/body/main/astro-island/div/div[3]/div[1]/span


Go Back To Home Page
    Click    //html/body/nav/div/div/astro-island/div/a

Open Todo
    Click    //html/body/main/astro-island/div/div[3]/div/div/a

Open Shared Todo List
    Click    //html/body/main/astro-island/div/div[5]/div/div/a

Register Second Account
    New Browser    headless=${TRUE}
    New Page    ${URL}/register
    Fill Text    id=username    ${SECONDUSERNAME}
    Fill Text    id=password    ${PASSWORD}    
    Click    //html/body/main/astro-island/div/form/div[3]/button[2]
    Get Url    ==    http://localhost:4321/todo-lists

Register
    New Browser    headless=${TRUE}
    New Page    ${URL}/register
    Fill Text    id=username    ${USERNAME}
    Fill Text    id=password    ${PASSWORD}    
    Click    //html/body/main/astro-island/div/form/div[3]/button[2]
    Get Url    ==    http://localhost:4321/todo-lists

Login
    New Browser    headless=${TRUE}
    New Page    ${URL}/login
    Fill Text    id=username    ${USERNAME}
    Fill Text    id=password    ${PASSWORD}    
    Click    //html/body/main/astro-island/div/form/div[3]/button[2]

Login Second
    New Browser    headless=${TRUE}
    New Page    ${URL}/login
    Fill Text    id=username    ${SECONDUSERNAME}
    Fill Text    id=password    ${PASSWORD}    
    Click    //html/body/main/astro-island/div/form/div[3]/button[2]

Create One Todo
    Click    text="New todo list"
    Fill Text    id=name    Pick up the groceries
    Fill Text    id=description    Ask instructions from the family
    Click    text="Create"    

Create Two Todo Lists
    Click    text="New todo list"
    Fill Text    id=name    Pick up the groceries
    Fill Text    id=description    Ask instructions from the family
    Click    text="Create" 
    Click    text="New todo list"
    Fill Text    id=name    Pick up the keys
    Fill Text    id=description    Ask instructions from the family
    Click    text="Create" 


Create Todos
    Click    text="New todo list"
    Fill Text    id=name    Pick up the groceries
    Fill Text    id=description    Ask instructions from the family
    Click    text="Create" 
    Click    text="New todo list"
    Fill Text    id=name    Pick up the keys
    Fill Text    id=description    Ask instructions from the family
    Click    text="Create" 
    Get Text    body    contains    "Pick up the groceries" 
    Get Text    body    contains    "Pick up the keys"

Change Values Of Todo List
    Click    //html/body/main/astro-island/div/div[3]/div[2]/div/div/button[1]
    Fill Text    id=name    Go to the gym
    Fill Text    id=description    Chest day
    Click    //html/body/main/astro-island/div/div[3]/div[2]/form/div/div[2]/button[1]

Delete Modified Lists 
    Click    //html/body/main/astro-island/div/div[3]/div[1]/div/div/button[3]
    Click    //html/body/main/astro-island/div/div[3]/div[2]/div/div/button[3]

Delete Two Todo Lists
    Click    //html/body/main/astro-island/div/div[3]/div[1]/div/div/button[3]
    Click    //html/body/main/astro-island/div/div[3]/div[2]/div/div/button[3] 

Delete Todo List
    Click    //html/body/main/astro-island/div/div[3]/div/div/div/button[3]
    Click    //html/body/main/astro-island/div/div[3]/div/div/dialog/div/div/button[2]

Modify Todo Item
    Click    //html/body/main/astro-island/div/div[3]/div[1]/div/button[2]
    Fill Text    id=description    Caramel or Caramel
    Click    //html/body/main/astro-island/div/div[3]/div[1]/div/form/div/div[2]/button[1]

Create Todo Items
    Click    //html/body/main/astro-island/div/div[2]/button 
    Click    //html/body/main/astro-island/div/div[2]/button   
    Fill Text    id=description    Tomato or Tomato
    Click    //html/body/main/astro-island/div/div[2]/div/form/div[2]/button[2]
    Click    //html/body/main/astro-island/div/div[2]/button
    Fill Text    id=description    Potato or Potato
    Click    //html/body/main/astro-island/div/div[2]/div/form/div[2]/button[2]

Delete Todo Items

    Click    //html/body/main/astro-island/div/div[3]/div[2]/div/button[3]
