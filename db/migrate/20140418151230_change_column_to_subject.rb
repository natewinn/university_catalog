class ChangeColumnToSubject < ActiveRecord::Migration
  def change
  	remove_column :subjects, :subect_name
  end
end
