class AddStartingAvgToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :starting_avg, :float
  end
end
