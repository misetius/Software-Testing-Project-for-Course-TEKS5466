# Test plan

In this Test plan the product under test is A simple web application that allows users to create and manage todos. 

Features of the app are listed below

- **User authentication** – Users can register, log in, and log out securely.

- **Todo list management** – Users can create, view, update, and delete their own todo lists.

- **Todo item management** – Within each list, users can create, view, update, and delete individual todo items.

- **List cloning** – Entire todo lists can be duplicated, including all their items.

- **List sharing** – Todo lists can be shared with other users for collaboration.

- **Live updates** – Shared lists update in real time using WebSocket technology.

## IN SCOPE

In this test plan manual testing, api testing, and E2E testing is used. 

Manual testing is done by freestyle exploratory method which gives tester good first feeling of the AUT. For this all the basic features and functions are tried such as registering, sharing, going back to page from link etc. 

API endpoints and E2E-tests are covered with automatic testing. 

API endpoint testing covers happy path tests for the most important endpoints concerned about handling todo lists and todo items in the lists. API endpoints tested are viewing created todo lists, creating todo lists, deleting todo lists, creating todo items and deleting todo items. 

E2E-tests cover happy paths for: 

- Registering a new user in the application
- Logging in to the application
- Logging out from the application
- Creating and deleting todo lists
- Modifying a todo list's name and description (as the list owner)
- Creating and deleting todo items in a todo list (as the list owner)
- Editing a todo item's description (as the list owner)
- Toggling a todo item's completed status (as the list owner)
- Sharing a todo list with another user (as the list owner)
- Viewing a shared todo list and its items (as the recipient/editor)

## OUT OF SCOPE

To make manual tests more comprehensive and more scripted manual could be used to complement the freestyle way the manual tests were done. 

To make automatic tests more comprehensive all the api endpoints should be tested. API endpoints such as sharing todo lists or cloning them are not in scope of this test plan.E2E-tests also do not test all the features of the app. Todo lists can for example be copied directly on the front which is not tested. For this testplan deemed to be the most important endpoints are tested. 




## TOOLS

Robotframework and Browser library is used for the end-to-end testing. Pytest and requests are used for the API endpoint testing. Python script which uses psycopg2-binary PostgreSQL Database Adapter is also used for clearing out the databases. Also passlib is used for hashing the password when user is directly created to the database.

## SCHEDULE





| Task | Description | Timeline |
|------|-------------|----------|
| Manual testing | Done in freestyle manner which will also give basic information of how the app actually works | 1. week  |
| Choose API endpoints to test | Todo lists and items creation, deletion, viewing deemed to be the most important | 1-2. week |
| Choose libraries and other methods to write the API endpoint | Requests library, psycopg2-binary and pytest chosen | 2-3. week |
| Write and implement testcases for the endpoints |  Test cases which test the chosen API endpoint are written and implemented locally | 3-4. week |
| Choose framework and libraries for E2E-testing |  Robotframework and Browser library Chosen | 5-6. week |
| Write and implement testcases for the E2E-testing |  Test cases are written and the tests can be run locally | 5-6. week |
| Implement Github Actions for E2E-tests |  Github Actions Yaml file written for Continuous Integration using the E2E-tests|7. week |