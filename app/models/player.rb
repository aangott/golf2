class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :suffix, :number, :flight
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :number, :presence => true
  validates :flight, :presence => true

  has_and_belongs_to_many :matches

  def number_and_name
    "#{number} - #{first_name} #{last_name} #{suffix}"
  end

  # later, when other models are created:
  # has_many :scores
  # has_many :points

end
