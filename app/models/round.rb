class Round < ActiveRecord::Base
  attr_accessible :date, :course, :matches_attributes

  has_many :matches
  accepts_nested_attributes_for :matches

  def is_in_past?
    Time.now > self.date
  end

end
