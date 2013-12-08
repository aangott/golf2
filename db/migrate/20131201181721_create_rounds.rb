class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.date :date

      t.timestamps
    end
  end
end
