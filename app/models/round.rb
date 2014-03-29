class Round < ActiveRecord::Base
  attr_accessible :date, :course, :matches_attributes, :note
  has_many :matches
  accepts_nested_attributes_for :matches

  COURSE_CHOICES = ['Front 9', 'Back 9', 'No Golf']
  SEASON_START_MONTH = 1

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
