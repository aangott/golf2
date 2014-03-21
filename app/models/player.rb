class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :suffix, :number, :flight
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :number, :presence => true
  validates :flight, :presence => true

  has_many :scores
  has_many :points

  has_many :matches1, :class_name => "Match", :foreign_key => :player1_id
  has_many :matches2, :class_name => "Match", :foreign_key => :player2_id

  @@score_history = 11

  def matches
    matches1 + matches2
  end

  def number_and_name
    "#{number} - #{first_name} #{last_name} #{suffix}"
  end

  def full_name
    "#{first_name} #{last_name} #{suffix}"
  end

  def last_scores
    last_scores = []
    last_matches = self.matches.sort_by { |match| match.round.date }.reverse
    
    # add in any scores from this season's matches starting from most recent
    idx = 0
    while last_scores.length < @@score_history and idx < last_matches.length do
      last_match = last_matches[idx]
      if last_match.player1_id == self.id
        score = last_match.score1
      elsif last_match.player2_id == self.id
        score = last_match.score2
      end

      if score.ultimate_value
        last_scores << score.ultimate_value
      end

      idx += 1
    end

    if last_scores.length == @@score_history
      return last_scores
    end

    # add in any scores that are not affilated with matches
    # grab all matches, create a list of all their scores
    all_matches = Match.all
    match_scores = Match.all.map { |match| match.score1_id } + 
                   Match.all.map { |match| match.score2_id }
    other_scores = Score.all.map { |score| score if not match_scores.include?(score.id) and score.player == self}.compact
    other_scores.sort_by! { |score| score.rowid }.reverse!
    
    idx = 0
    while last_scores.length < @@score_history and idx < other_scores.length do
      score = other_scores[idx]
      if score.ultimate_value
        last_scores << score.ultimate_value
      end
      idx += 1
    end

    while last_scores.length < @@score_history
      last_scores << nil
    end

    return last_scores
    
  end
  
  def avg_score
    last_scores = self.last_scores.compact
    last_scores.inject { |sum, el| sum + el }.to_f / last_scores.length
  end

  
end
