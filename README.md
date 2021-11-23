# COMP9322 - Chatbot  by Wincent Winarko (z5240353)

## Technology

Frontend:

- react

- create-react-app
- react-chatbot-kit (https://www.npmjs.com/package/react-chatbot-kit)
- styled-components

Backend:

- python 3
- flask
- flask-cors
- swagger-py-codegen
- mysql-connector-python
- WIT.ai

Database:

- MySQL

## Directory Tree

```bash
root
|- chatbot (chatbot interaction)
	|-frontend
	|-backend
|- cinema (Cinema service)
	|- swagger.yaml
	|- cinema-app
		|- Dockerfile
		|- requirement.txt
		|- cinema
|- database (Mysql container)
	|- docker-compose.yaml
	|- init
		|- basedata.sql
```



## Instruction

1.  Create docker network

   `$ docker network create chatbot-network`

2.  Cd to `./database`

3. docker-compose build and up cinema service and database(database on port 5432 and cinema on port 5001)

​		`$ docker-compose up --build`

 	4. Open new terminal
 	5. Cd to `./chatbot`
 	6. Set up the backend
 	7. Cd to ./backend/chatbot-app-ui
 	8. `$ pip3 install -r requirement.txt`
 	9. Cd to `./chatbot-ui`
 	10. Run the chatbot backend server (it will run on port 5000)

​	`$ python3 __init__.py`

11. Open another terminal
12. Cd to `./chatbot/frontend`
13. Run `npm install` to install all required packages
14. Run `npm start` and enjoy the chatbot (frontend on port 3000)

## Credential

**wit.ai account**

email: centwin@protonmail.com

password: centwin9322

