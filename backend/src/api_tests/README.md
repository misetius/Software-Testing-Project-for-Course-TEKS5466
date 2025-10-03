# API Endpoint testing guide

For the tests to work you need to install requests, pytest and psycopg2. So before trying to do any tests use these commands:
```
pip install pytest
pip install psycopg2-binary
pip install requests
pip install passlib
pip install bcrypt==3.2.2


```

After installing the needed dependencies start the development environment in the folder of the todo-list app with

```
docker compose -f compose.dev.yml up
```

For the tests we use development environment because we do not want to run the tests with the production database.

After the containers have started just run pytest command on command line from this directory where this readme.md file also exists.