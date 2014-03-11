class AddNoteToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :note, :string
  end
end
