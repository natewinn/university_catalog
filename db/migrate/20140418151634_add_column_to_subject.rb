class AddColumnToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :subject_name, :string
  end
end
