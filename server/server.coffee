Meteor.startup ->
  
  unless Courses.findOne()
    # add some courses
    seed = [
      name: "Computer Organization"
      year: 2
      credit_hours: 3
      faculty: "Computer Science"
    ,
      name: "Introduction to Computer Science"
      year: 1
      credit_hours: 3
      faculty: "Computer Science"
    ,
      name: "Database Management"
      year: 3
      credit_hours: 3
      faculty: "Computer Science"
    ,
      name: "History of North America"
      year: 1
      credit_hours: 6
      faculty: "Arts"
    ,
      name: "Bio-Chemistry"
      year: 2
      credit_hours: 3
      faculty: "Science"
    ,
      name: "Critical Thinking"
      year: 1
      credit_hours: 3
      faculty: "Philosophy"
    ,
      name: "Introductory Financial Accounting"
      year: 1
      credit_hours: 3
      faculty: "Business"
    ]
    for course in seed
      Courses.insert course

  unless Faculties.findOne()
    seed = [
      name: "Science"
    ,
      name: "Arts"
    ,
      name: "Business"
    ,
      name: "Computer Science"
    ,
      name: "Philosophy"
    ]
    for faculty in seed
      Faculties.insert faculty
