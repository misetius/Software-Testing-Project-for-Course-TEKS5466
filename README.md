# Software-testing-Project-for-Course-TEKS5466

This project is part of a software testing course and focuses on planning, executing, and automating tests for a simple shared todo list management application. The original application is available on GitHub: sjsarsa/swt-todo-list-app. In every folder there is a guide for running the tests. 

A simple web application for creating and managing todo lists with user accounts, real-time updates, and sharing features.

To run the application, make sure you have Docker and Docker Compose installed. Then, in the project directory, start the containers with:

```
docker compose up
```


Once the services are running, open your browser and go to http://localhost
 to use the app.

For development with hot reloading, use:

```
docker compose -f compose.dev.yml up
```


Then open http://localhost:4321.