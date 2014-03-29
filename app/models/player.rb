class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :suffix, :number, :flight, :starting_avg
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :number, :presence => true
  validates :flight, :presence => true
  validates :starting_avg, numericality: true, :allow_blank => true

  has_many :scores
  has_many :points
  has_many :matches1, :class_name => "Match", :foreign_key => :player1_id
  has_many :matches2, :class_name => "Match", :foreign_key => :player2_id

  FLIGHT_CHOICES = ['1', '2', 'Sub']
  NUM_SCORES_FOR_AVG = 10
  # if a player has less than 3 scores in the league, calculate their average by
  # filling in fake scores corresponding to the player's starting avg.
  MIN_SCORES_FOR_AVG = 3
  SCORE_HISTORY = NUM_SCORES_FOR_AVG + 1

  def self.players_by_flight
    pbf = ActiveSupport::OrderedHash.new
    pbf['First Flight'] = Player.where(:flight => '1')
    pbf['Second Flight'] = Player.where(:flight => '2')  
    pbf['Substitutes'] = Player.where(:flight => 'Sub')
    return pbf
  end

  def matches
    matches1 + matches2
  end

  def number_and_name
    "#{number} - #{first_name} #{last_name[0]}. #{suffix}"
  end

  def full_name
    "#{first_name} #{last_name[0]}. #{suffix}"
  end

  def matches_by_date
    # most recent match first
    self.matches.sort_by { |match| match.round.date }.reverse
  end

  def score_info(match)
    if not match
      return 'n/a'
    end

    score = match.player_score(self)
    if score
      return score.orig_and_adjusted
    end
  end

  def points_info(match)
    if not match
      return 'n/a'
    end

    points = match.player_points(self)
    if points and points.value
      return points.value
    end
    return 0
  end

  def total_points
    points = 0

    matches = self.matches_by_date
    curr_matches = matches.map { |match| match if match.round.in_current_season? }.compact
    curr_matches.each do |match|
      points += self.points_info(match)
    end
    return points
  end

  def last_scores
    last_scores = []
    last_matches = self.matches_by_date
    
    # add in any scores from this season's matches starting from most recent
    idx = 0
    while last_scores.length < SCORE_HISTORY and idx < last_matches.length do
      last_match = last_matches[idx]
      score = last_match.player_score(self)
      if score.ultimate_value
        last_scores << score.ultimate_value
      end

      idx += 1
    end

    if last_scores.length == SCORE_HISTORY
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
    while last_scores.length < SCORE_HISTORY and idx < other_scores.length do
      score = other_scores[idx]
      if score.ultimate_value
        last_scores << score.ultimate_value
      end
      idx += 1
    end

    while last_scores.length < SCORE_HISTORY
      last_scores << nil
    end

    return last_scores
    
  end
  
  def avg_score
    last_scores = self.last_scores.compact
    last_scores = last_scores.slice(0, NUM_SCORES_FOR_AVG)

    if self.starting_avg
      while last_scores.length < MIN_SCORES_FOR_AVG
        last_scores << self.starting_avg
      end
    end

    if last_scores.empty?
      return 0
    end

    last_scores.inject { |sum, el| sum + el }.to_f / last_scores.length
  end
  
end















