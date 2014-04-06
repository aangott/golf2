class Match < ActiveRecord::Base
  attr_accessible :round_id, :player1_id, :player2_id, :score1, :score2, :score1_attributes, :score2_attributes, :points1, :points2, :points1_attributes, :points2_attributes

  belongs_to :player1, :class_name => 'Player'
  belongs_to :player2, :class_name => 'Player'
  belongs_to :score1, :class_name => 'Score'
  belongs_to :score2, :class_name => 'Score'
  belongs_to :points1, :class_name => 'Point'
  belongs_to :points2, :class_name => 'Point'
  belongs_to :round

  accepts_nested_attributes_for :score1, :score2, :points1, :points2

  before_destroy :delete_scores_and_points

  def delete_scores_and_points
    self.score1.destroy
    self.score2.destroy
    self.points1.destroy
    self.points2.destroy
  end

  def player_score(player)
    if self.player1_id == player.id
      return self.score1
    elsif self.player2_id == player.id
      return self.score2
    end
  end

  def player_points(player)
    if self.player1_id == player.id
      return self.points1
    elsif self.player2_id == player.id
      return self.points2
    end
  end

end
