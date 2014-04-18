class CreateCourses < ActiveRecord::Migration
  def change
  	create_table :courses do |t|
  	  t.string :course_name
  		t.integer :course_number
  		t.string :start_time
  		t.integer :professor_id
  		t.integer :subject_id
  	end
  end
end
