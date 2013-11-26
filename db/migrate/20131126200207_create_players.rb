class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :suffix
      t.string :number
      t.string :flight

      t.timestamps
    end
  end
end
