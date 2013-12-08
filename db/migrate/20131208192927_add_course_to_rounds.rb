class AddCourseToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :course, :string
  end
end
