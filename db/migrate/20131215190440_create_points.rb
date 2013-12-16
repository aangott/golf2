class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :value
      t.integer :player_id

      t.timestamps
    end
  end
end
