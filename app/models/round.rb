class Round < ActiveRecord::Base
  attr_accessible :date, :course, :matches_attributes

  has_many :matches
  accepts_nested_attributes_for :matches

end
