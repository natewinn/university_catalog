class CreateSubjects < ActiveRecord::Migration
  def change
  	create_table :subjects do |t|
		  t.string :subect_name
		end
  end
end
