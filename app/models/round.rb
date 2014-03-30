class Round < ActiveRecord::Base
  attr_accessible :date, :course, :matches_attributes, :note
  has_many :matches
  accepts_nested_attributes_for :matches

  COURSE_CHOICES = ['Front 9', 'Back 9', 'No Golf']
  SEASON_START_MONTH = 4
  MATCHES_PER_ROUND = 11

  def self.last_scored_round
    rounds = Round.all.map { |round| round if round.in_current_season? }.compact
    sorted_rounds = rounds.sort_by { |round| round.date }.reverse
    sorted_rounds.each do |round|
      round.matches.each do |match|
        if match.score1.ultimate_value or match.score2.ultimate_value
          return round
        end
      end
    end
    return nil
  end

  def is_in_past?
    Time.now > self.date
  end

  def in_current_season?
    today = Time.now
    # from the start of a season through the end of the year, "current" scores
    # are from the current year's season.
    if today.mon >= SEASON_START_MONTH 
      if self.date.year == today.year
        return true
      end
    end
  
    # for the part of the year before the season starts, "current" scores will
    # be from last year's season.
    if today.mon < SEASON_START_MONTH
      if self.date.year == (today.year - 1)
        return true
      end
    end

    return false
  end

end
