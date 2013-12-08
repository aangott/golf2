class Match < ActiveRecord::Base
  attr_accessible :round_id, :player1_id, :player2_id, :score1, :score2, :score1_attributes, :score2_attributes


  belongs_to :player1, :class_name => 'Player'
  belongs_to :player2, :class_name => 'Player'
  belongs_to :score1, :class_name => 'Score'
  belongs_to :score2, :class_name => 'Score'

  accepts_nested_attributes_for :score1, :score2

end
