class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :value
      t.integer :adjusted
      t.integer :player_id

      t.timestamps
    end
  end
end
