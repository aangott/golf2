class Round < ActiveRecord::Base
  attr_accessible :date, :course, :matches_attributes, :note
  has_many :matches
  accepts_nested_attributes_for :matches

  COURSE_CHOICES = ['Front 9', 'Back 9', 'No Golf']

  def is_in_past?
    Time.now > self.date
  end

end
