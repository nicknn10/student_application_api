import json
from bottle import route, run, error, request, response

@route('/hello/<name>')
def index(name):
    response.status = 200
    response.content_type = 'application/json'
    greeting = f"Hello, {name}!"
    return json.dumps({'message': greeting })
    

@error(404)
def error404(code):
    response.status = 404
    response.content_type = 'application/json'
    
    return json.dumps({'message': 'This endpoint does not exist'})

run(host='localhost', port=8080, reloader=True)