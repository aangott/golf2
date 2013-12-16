class CreateMatchesPlayers < ActiveRecord::Migration
  def up
    create_table :matches_players, :id => false do |t|
      t.references :match
      t.references :player
    end
  end

  def down
    drop_table :matches_players
  end
end
