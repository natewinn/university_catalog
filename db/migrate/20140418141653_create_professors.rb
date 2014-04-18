class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
  	  t.string :name
  		t.string :email_address
  		t.string :office_location
  	end
  end
end
