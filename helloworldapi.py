import json
from bottle import route, run, template, error, abort

@route('/hello/<name>')
def index(name):
    abort(404, 'just testing')
    return template('<b>Hello {{name}}</b>!', name=name)


@error(404)
def error404(code):
    print(code)
    return "This page does not exist"

run(host='localhost', port=8080, reloader=True)