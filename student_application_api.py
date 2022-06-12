import datetime
import simplejson as json
import mysql.connector
from bottle import abort, error, request, response, route, run


# Edit db configuration 
db = mysql.connector.connect(
  host="localhost",
  user="sa",
  password="softimpact",
  database="studentappdb"
)
# End of db configuration


@route('/quarter', method="GET")
def getquarters():
    try:
        dbcursor = db.cursor()
        dbcursor.execute("select QuarterYearId , Title from quarteryears q ")
        result = [dict((dbcursor.description[i][0], value) \
               for i, value in enumerate(row)) for row in dbcursor.fetchall()]
        dbcursor.close()
    except:
        abort(500, "An unexpected error occurred")

    response.status = 200
    response.content_type = 'application/json'
    return json.dumps(result)


@route('/student', method="GET")
def getstudents():
    try:
        dbcursor = db.cursor()
        dbcursor.execute("SELECT studentid AS id, s.name, CAST(DateOfBirth AS CHAR) AS dateOfBirth, c.name AS class FROM students s INNER JOIN Classes c ON c.ClassId = s.ClassId")
        result = [dict((dbcursor.description[i][0], value) \
               for i, value in enumerate(row)) for row in dbcursor.fetchall()]
        dbcursor.close()
    except:
        abort(500, "An unexpected error occurred")

    response.status = 200
    response.content_type = 'application/json'
    return json.dumps(result)


@route('/student/<id:int>', method="GET")
def getstudentbyid(id):
    try:
        dbcursor = db.cursor()
        command = f"SELECT studentid AS id, s.name, CAST(DateOfBirth AS CHAR) AS dateOfBirth, c.name AS class FROM students  s INNER JOIN Classes c ON c.ClassId = s.ClassId WHERE s.studentid = {id}"        
        dbcursor.execute(command)
        
        row_values = dbcursor.fetchall()     

        if len(row_values) == 0:            
            message = f"Student with id {id} does not exist"
            raise ValueError(message)

        row_headers=[x[0] for x in dbcursor.description] 
        result = dict(zip(row_headers,row_values[0]))
       
    except ValueError as er:        
        abort(400, er.args[0])
    except:
        abort(500, "An unexpected error occurred")

    response.status = 200
    response.content_type = 'application/json'
    return json.dumps(result)


@route('/student', method="POST")
def createstudent():
    data = request.body.read()
    if not data:
        abort(400, 'No data received')
    entity = json.loads(data)

    if not ("name" in entity.keys()):
        abort(400, 'No name specified')
    if not ("dateOfBirth" in entity.keys()):
        abort(400, "No dateOfBirth value provided")
    if not ("classId" in entity.keys()):
        abort(400, "No classId value provided")

    try:
        datetime.datetime.strptime(entity["dateOfBirth"],"%Y-%m-%d")
    except:
        abort(400, "dateOfBirth value must be of format yyyy-mm-dd")

    try: 
        dbcursor = db.cursor()
        command = f'select * from classes c where c.classId = {entity["classId"]}'    
        dbcursor.execute(command)
        row_values = dbcursor.fetchall()     
        print(row_values)
        if len(row_values) == 0:            
            message = f'Class with id {entity["classId"]} does not exist'
            dbcursor.close()            
            raise ValueError(message)
        dbcursor.close()
    except ValueError as er:        
        abort(400, er.args[0])
    except: 
        abort(500, "An unexpected error occurred")

    try:
        dbcursor = db.cursor()
        command = f'insert into students(name, dateOfBirth, classId) values (\"{entity["name"]}\",\"{entity["dateOfBirth"]}\",{entity["classId"]})'
        
        dbcursor.execute(command)
        new_id = (dbcursor.lastrowid)
        
        db.commit()
        dbcursor.close()
    except: 
        abort(500, "An unexpected error occurred")

    response.status = 201
    response.content_type = 'application/json'
    message = f"Student created with id: {new_id}"
    
    return json.dumps({"message": message })


@route('/student/<studentId:int>/grade', method="POST")
def creategrade(studentId):
    try: 
        dbcursor = db.cursor()
        command = f'select * from students s where s.studentId = {studentId}'    
        dbcursor.execute(command)
        row_values = dbcursor.fetchall()     

        if len(row_values) == 0:            
            message = f'Student with id {studentId} does not exist'
            dbcursor.close()            
            raise ValueError(message)
        dbcursor.close()
    except ValueError as er:        
        abort(400, er.args[0])
    except: 
        abort(500, "An unexpected error occurred")
    
    data = request.body.read()
    if not data:
        abort(400, 'No data received')
    entity = json.loads(data)

    if not ("quarterYearId" in entity.keys()):
        abort(400, 'No quarterYearId value provided')
    if not ("grade" in entity.keys()):
        abort(400, "No grade value provided")
    if not ("subjectId" in entity.keys()):
        abort(400, "No subjectId value provided")

    if(entity["grade"]<0 or entity["grade"]>10):
        abort(400, "Grade value must be between 0 and 10")

    try: 
        dbcursor = db.cursor()
        command = f'select * from subjects s where s.subjectId = {entity["subjectId"]}'    
        dbcursor.execute(command)
        row_values = dbcursor.fetchall()     
        
        if len(row_values) == 0:            
            message = f'Subject with id {entity["subjectId"]} does not exist'
            dbcursor.close()            
            raise ValueError(message)
        dbcursor.close()
    except ValueError as er:        
        abort(400, er.args[0])
    except: 
        abort(500, "An unexpected error occurred")

    try: 
        dbcursor = db.cursor()
        command = f'select * from quarterYears q where q.quarterYearId = {entity["quarterYearId"]}'    
        dbcursor.execute(command)
        row_values = dbcursor.fetchall()     
        if len(row_values) == 0:            
            message = f'QuarterYear with id {entity["quarterYearId"]} does not exist'
            dbcursor.close()            
            raise ValueError(message)
        dbcursor.close()
    except ValueError as er:        
        abort(400, er.args[0])
    except: 
        abort(500, "An unexpected error occurred")
    
    
    try:
        dbcursor = db.cursor()        
        command = f'insert into grades(studentId, subjectId, quarterYearId, grade) values({studentId}, {entity["subjectId"]}, {entity["quarterYearId"]}, {entity["grade"]})'        
        dbcursor.execute(command)
        new_id = (dbcursor.lastrowid)
        db.commit()
        dbcursor.close()
    except: 
        abort(500, "An unexpected error occurred")

    response.status = 201
    response.content_type = 'application/json'
    message = f"Grade created with id: {new_id}"
    
    return json.dumps({"message": message })
    

@route('/grade/<gradeId:int>', method="PUT")
def updategrade(gradeId):
    try: 
        dbcursor = db.cursor()
        command = f'select * from grades g where g.gradeId = {gradeId}'    
        dbcursor.execute(command)
        row_values = dbcursor.fetchall()     

        if len(row_values) == 0:            
            message = f'Grade with id {gradeId} does not exist'
            dbcursor.close()            
            raise ValueError(message)
        dbcursor.close()
    except ValueError as er:        
        abort(400, er.args[0])
    except: 
        abort(500, "An unexpected error occurred")

    data = request.body.read()
    if not data:
        abort(400, 'No data received')
    entity = json.loads(data)

    if not ("grade" in entity.keys()):
        abort(400, "No grade value provided")

    if(entity["grade"]<0 or entity["grade"]>10):
        abort(400, "Grade value must be between 0 and 10")

    try:
        dbcursor = db.cursor()        
        command = f'update grades g set grade={entity["grade"]} where g.gradeId={gradeId}' 
        print(command)       
        dbcursor.execute(command)
        db.commit()
        dbcursor.close()
    except: 
        abort(500, "An unexpected error occurred")

    response.status = 200
    response.content_type = 'application/json'
    message = "Grade record updated"
    
    return json.dumps({"message": message })


@route('/statistics/studentperquarter/<studentId:int>', method="GET")
def statisticsforstudentperquarter(studentId):
    try:
        dbcursor = db.cursor()
        command = f"SELECT * FROM students s WHERE s.studentid = {studentId}"        
        dbcursor.execute(command)
        
        row_values = dbcursor.fetchall()     

        if len(row_values) == 0:            
            message = f"Student with id {studentId} does not exist"
            raise ValueError(message)
        
        dbcursor.close()
        dbcursor = db.cursor()
          
        command = f"select q.Title as quartertitle, avg(grade) as average from grades g inner join quarteryears q on g.QuarterYearId = q.QuarterYearId where g.StudentId = {studentId} group by q.QuarterYearId "
        
        dbcursor.execute(command)

        result = [dict((dbcursor.description[i][0], value) \
            for i, value in enumerate(row)) for row in dbcursor.fetchall()]
        dbcursor.close()
    except ValueError as er:        
        abort(400, er.args[0])
    except:
        abort(500, "An unexpected error occurred")

    response.status = 200
    response.content_type = 'application/json'
    return json.dumps(result)


@route('/statistics/gradesperquarter/<subjectId:int>', method="GET")
def statisticsforgradesperquarter(subjectId):
    try:
        dbcursor = db.cursor()
        command = f"SELECT * FROM subjects s WHERE s.subjectid = {subjectId}"        
        dbcursor.execute(command)
        
        row_values = dbcursor.fetchall()     

        if len(row_values) == 0:            
            message = f"Subject with id {subjectId} does not exist"
            raise ValueError(message)
        
        dbcursor.close()
        dbcursor = db.cursor()

        command = f"select q.Title as quartertitle, avg(grade) as average, s.name AS subject from grades g inner join quarteryears q on g.QuarterYearId = q.QuarterYearId inner join Subjects s on s.subjectId = g.SubjectId where g.SubjectId = {subjectId} group by q.QuarterYearId "
        
        dbcursor.execute(command)

        result = [dict((dbcursor.description[i][0], value) \
            for i, value in enumerate(row)) for row in dbcursor.fetchall()]
        dbcursor.close()
    except ValueError as er:        
        abort(400, er.args[0])
    except:
        abort(500, "An unexpected error occurred")

    response.status = 200
    response.content_type = 'application/json'
    return json.dumps(result)


@route('/statistics/generalaverageperquarter/<quarterYearId:int>', method="GET")
def statisticsforgradesperquarter(quarterYearId):
    try:
        dbcursor = db.cursor()
        command = f"SELECT * FROM QuarterYears q WHERE q.quarteryearid = {quarterYearId}"        
        dbcursor.execute(command)
        
        row_values = dbcursor.fetchall()     

        if len(row_values) == 0:            
            message = f"QuarterYear with id {quarterYearId} does not exist"
            raise ValueError(message)
        
        dbcursor.close()
        dbcursor = db.cursor()

        command = f"select q.Title as quartertitle, avg(grade) as average, s.name as subject from grades g inner join quarteryears q on g.QuarterYearId = q.QuarterYearId inner join subjects s on s.SubjectId = g.subjectId where q.QuarterYearId = {quarterYearId} group by g.SubjectId  "
        
        dbcursor.execute(command)

        result = [dict((dbcursor.description[i][0], value) \
            for i, value in enumerate(row)) for row in dbcursor.fetchall()]
        dbcursor.close()
    except ValueError as er:        
        abort(400, er.args[0])
    except:
        abort(500, "An unexpected error occurred")

    response.status = 200
    response.content_type = 'application/json'
    return json.dumps(result)


@error(400)
def error400(error):
    response.status = 400
    response.content_type = 'application/json'
    
    return json.dumps({'message': error.body})


@error(404)
def error404(error):
    response.status = 404
    response.content_type = 'application/json'
    
    return json.dumps({'message': error.body})


@error(500)
def error500(error):
    response.status = 500
    response.content_type = 'application/json'
    
    return json.dumps({'message': error.body})




if __name__ == '__main__':
    run(host='localhost', port=8080, reloader=True)