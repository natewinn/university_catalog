require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///course_catalog.db"


# Route to Main Landing Page -------------->

get "/" do
	erb :"index"
end

# Route to view all records -------------->

get "/courses" do
	@available_courses = Course.all
	erb :"/courses/index"
end	

# Route to view individual records ------->

get "/courses/:id" do
	@course_open = Course.find(params[:id])
	erb :"/courses/show"
end

# Route to create new record ------------->

post "/courses/new" do
	puts params[:course]
	course = Course.new(params[:course])
	if course.save
		redirect "/courses"
	end
end

# Route to Edit Individual Records ------->

get "/:id/edit" do
	@course_open = Courses.find(params[:id])
	erb :"/courses/edit"
end

# Route to Delete Individual Records ----->

delete '/course/:id' do
	@course_open = Course.find(find[:id])
	@course_open.destroy
	redirect '/courses'
end

# Classes -------------------------------->

class Professor < ActiveRecord::Base
end

class Subject < ActiveRecord::Base
end

class Course < ActiveRecord::Base
end