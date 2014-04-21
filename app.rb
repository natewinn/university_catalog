require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///course_catalog.db"


# Route to Main Landing Page -------------->

get "/" do
	erb :"index"
end

# Routes to view all records -------------->

get "/courses" do
	@available_courses = Course.all
	@available_professors = Professor.all
	@available_subjects = Subject.all
	erb :"/courses/index"
end

get "/professors" do
	@available_professors = Professor.all
	erb :"/professors/index"
end

get "/subjects" do
	@available_subjects = Subject.all
	erb :"/subjects/index"
end

# Routes to view individual records ------->

get "/courses/:id" do
	@course = Course.find(params[:id])
	erb :"/courses/show"
end

get "/professors/:id" do
	@professor = Professor.find(params[:id])
	erb :"/professors/show"
end

get "/subjects/:id" do
	@subject = Subject.find(params[:id])
	erb :"/subjects/show"
end

# Routes to create new record ------------->

post "/courses" do
	# puts params[:course]
	course = Course.new(params[:course])
	if course.save
		redirect "/courses"
	end
end


post "/professors/new" do
	puts params[:professor]
	professor = Professor.new(params[:professor])
	if professor.save
		redirect "/professors"
	end
end

post "/subjects/new" do
	puts params[:subject]
	subject = Subject.new(params[:subject])
	if subject.save
		redirect "/subjects"
	end
end

# Routes to Edit Individual Records ------->

get "/courses/:id/edit" do
	@course_open = Course.find(params[:id])
	@professor_open = Professor.find(@course_open.professor_id)
	@subject_open = Subject.find(@course_open.subject_id)
	erb :"/courses/edit"
end

get "/professors/:id/edit" do
	@professor_open = Professor.find(params[:id])
	erb :"/professors/edit"
end

get "/subjects/:id/edit" do
	@subject_open = Subject.find(params[:id])
	erb :"/courses/edit"
end

# Routes that Update Individual Records ------->

put "/courses/:id" do
	@course_open = Course.find(params[:id])
	@course_open.update_attributes(params[:course])
		redirect "/courses"
end

put "/professors/:id" do
	@professor_open = Professor.find(params[:id])
	@professor_open.update_attributes(params[:professor])
		redirect "/professors"
end

put "/subjects/:id" do
	@subject_open = Subjects.find(params[:id])
	@subject_open.update_attributes(params[:subject])
		redirect "/subjects"
end

# Route to Delete Individual Records ----->

delete '/courses/:id' do
	@course_open = Course.find(params[:id])
	@course_open.destroy
	redirect '/courses'
end

delete '/professors/:id' do
	@professor_open = Professor.find(params[:id])
	@professor_open.destroy
	redirect '/professors'
end

delete '/subjects/:id' do
	@subject_open = Course.find(params[:id])
	@subject_open.destroy
	redirect '/subjects'
end

# Classes -------------------------------->

class Course < ActiveRecord::Base
end

class Professor < ActiveRecord::Base
end

class Subject < ActiveRecord::Base
end