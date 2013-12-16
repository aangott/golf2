class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :round_id

      t.references :player1
      t.references :player2
      t.references :score1
      t.references :score2
      t.references :points1
      t.references :points2

      t.timestamps
    end
  end
end
