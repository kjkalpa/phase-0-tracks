# require gems
require 'sinatra'
require 'sqlite3'

# this allows the styles to be accessed from static folder
set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  # @ to make variable accessible within HTML template
  @students = db.execute("SELECT * FROM students")
  # returns template via Sinatra ERB method and symbol referring to file. parentheses optional erb(:home)
  erb :home
end

get '/students/new' do
  erb :new_student
end

# testing out student retrieval

get '/students/directory' do
  @studentsCampus = db.execute("SELECT * FROM students ORDER BY campus, name")
  erb :directory
end

# Cohort table
get '/cohort/new' do
  @studentsCohort = db.execute("SELECT name FROM students ORDER BY name")
  erb :cohort
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# Cohort form
post '/cohort' do
   p params
  db.execute("UPDATE students SET cohort = ? WHERE name = ?", [params['cohort'], params['name']])

  redirect '/'
end