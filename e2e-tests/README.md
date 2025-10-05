### HOW TO RUN E2E-tests Locally

For E2E-tests you need to install few libraries. For E2E-tests we are using Robot Framework and Browser Library which uses Playwright. Python script is also used to clear out the database tables between tests. This script uses psycopg2-binary. You can install these with these commands.

```
pip install robotframework
pip install psycopg2-binary
pip install requests
```

For some reason registering to app is a bit flaky process. Because of this tests use keyword "Wait Until Keyword Succeeds" for registering and login. 

After installing the needed dependencies start the development environment in the folder of the todo-list app with

```
docker compose -f compose.dev.yml up
```

For the tests we use development environment because we do not want to run the tests with the production database.

After the containers have started run command below in this directory.
```
robot --listener RetryFailed test.robot
```