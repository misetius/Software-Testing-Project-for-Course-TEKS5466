# Items on shared todo lists are cloned related to the amount of editors

Problem occurs when todo list is shared for two or more persons and they are given editor rights. If one of the editor creates new item to the todo list it gets cloned to the owner for the amount of editors in the todo list. For example when one editor makes new entry to the todo list and owner checks it out the entry will appear two times for the owner if there are two editors on the shared todo list.

## Environment

Google Chrome

## Action Performed

1. Create todo list
2. Click todo and share the todo list with at least two persons and give them editor rights
3. login to one one of the accounts that the todo list was shared with
4. Create new task on the shared todo list
5. logout and login back to the owner of the todo list
6. Check the shared todo list


## Expected Result

Owner should see only one task on the shared todo list.

## Actual Result

Owner of the todo list has task duplicated related to the amount of person with editor rights. 

