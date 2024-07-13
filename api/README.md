# Python REST API Development

A simple Python REST API is built with two endpoints one is for the GET method and another is for the POST method. Here '/' root route is used for the GET method which returns the 'Hello World!' message.

    $ curl HTTP://localhost:5000/

The POST method /name API is configured in Python code which retrieves JSON data sent in the body of the POST request and stores it in the 'data' variable and returns the received JSON data back to the client as a JSON response. 

    $ curl -X POST -H "Content-Type: application/json" -d '{"name":"jaglu"}' http://localhost:5000/name
