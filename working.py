import csv

with open('data.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
        else:
            studentID = row[0]
            classId = 0      
            quarterYearId = 0

            if row[3] == 'IT Class':
                classId = 1
            if row[3] == 'Math Class':
                classId = 2
            if row[3] == 'Literature Class':
                classId = 3
            
            if (row[4] == '2009' and row[5] == 'Q1'):
                quarterYearId = 1
            if (row[4] == '2009' and row[5] == 'Q2'):
                quarterYearId = 2
            if (row[4] == '2009' and row[5] == 'Q3'):
                quarterYearId = 3
            if (row[4] == '2009' and row[5] == 'Q4'):
                quarterYearId = 4

            if (row[4] == '2010' and row[5] == 'Q1'):
                quarterYearId = 5
            if (row[4] == '2010' and row[5] == 'Q2'):
                quarterYearId = 6
            if (row[4] == '2010' and row[5] == 'Q3'):
                quarterYearId = 7
            if (row[4] == '2010' and row[5] == 'Q4'):
                quarterYearId = 8

            if (row[4] == '2011' and row[5] == 'Q1'):
                quarterYearId = 9
            if (row[4] == '2011' and row[5] == 'Q2'):
                quarterYearId = 10
            if (row[4] == '2011' and row[5] == 'Q3'):
                quarterYearId = 11
            if (row[4] == '2011' and row[5] == 'Q4'):
                quarterYearId = 12

            print(f'insert into grades (StudentId,ClassId, QuarterYearId, SubjectId, Grade) values({studentID},{classId},{quarterYearId},1,{row[6]});')
            print(f'insert into grades (StudentId,ClassId, QuarterYearId, SubjectId, Grade) values({studentID},{classId},{quarterYearId},2,{row[7]});')
            print(f'insert into grades (StudentId,ClassId, QuarterYearId, SubjectId, Grade) values({studentID},{classId},{quarterYearId},3,{row[8]});')
            line_count += 1

    print(f'Processed {line_count} lines.')