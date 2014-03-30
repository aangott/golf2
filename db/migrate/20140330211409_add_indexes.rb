class AddIndexes < ActiveRecord::Migration
  def up
    add_index :matches, :round_id, :name => 'idx_matches_round_id'
    add_index :matches, :player1_id, :name => 'idx_matches_player1_id'
    add_index :matches, :player2_id, :name => 'idx_matches_player2_id'
    add_index :matches, :score1_id, :name => 'idx_matches_score1_id'
    add_index :matches, :score2_id, :name => 'idx_matches_score2_id'
    add_index :matches, :points1_id, :name => 'idx_matches_points1_id'
    add_index :matches, :points2_id, :name => 'idx_matches_points2_id'

    add_index :points, :player_id, :name => 'idx_points_player_id'
    
    add_index :scores, :player_id, :name => 'idx_scores_player_id'

    add_index :matches_players, :match_id, :name => 'idx_matches_players_match_id'
    add_index :matches_players, :player_id, :name => 'idx_matches_players_player_id'
  end

  def down
    remove_index :matches, :name => 'idx_matches_round_id'
    remove_index :matches, :name => 'idx_matches_player1_id'
    remove_index :matches, :name => 'idx_matches_player2_id'
    remove_index :matches, :name => 'idx_matches_score1_id'
    remove_index :matches, :name => 'idx_matches_score2_id'
    remove_index :matches, :name => 'idx_matches_points1_id'
    remove_index :matches, :name => 'idx_matches_points2_id'

    remove_index :points, :name => 'idx_points_player_id'
    
    remove_index :scores, :name => 'idx_scores_player_id'

    remove_index :matches_players, :name => 'idx_matches_players_match_id'
    remove_index :matches_players, :name => 'idx_matches_players_player_id'
  end
end
