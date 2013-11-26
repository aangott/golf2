class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :suffix, :number, :flight
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :number, :presence => true
  validates :flight, :presence => true

  # later, when other models are created:
  # has_many :scores
  # has_many :points

end
