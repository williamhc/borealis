Session.setDefault 'search_params', {}

selectToInClause = (select, scope, all = '') ->
  params = Session.get 'search_params'
  vals = (opt.value for opt in select.find("option:selected"))
  vals = (parseInt(v) or v for v in vals)
  if vals and all not in vals
    params[scope] = 
      $in: vals
  else
    delete params[scope]
  Session.set 'search_params', params

# course_list: the list of courses matching the current search
Template.course_list.courses = ->
  params = Session.get 'search_params'
  Courses.find params, limit: 10

# course_search: the advanced search form
Template.course_search.faculties = ->
  Faculties.find()

Template.course_search.events = 
  'change #facultySelect': (e) ->
    selectToInClause $("#facultySelect"), 'faculty', 'All faculties'
  'change #yearSelect': (e) ->
    selectToInClause $("#yearSelect"), 'year', 'All years'
  'change #creditHoursSelect': (e) ->
    selectToInClause $("#creditHoursSelect"), 'credit_hours', 'All credits'
