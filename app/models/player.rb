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

  def matches
    matches1 + matches2
  end

  def number_and_name
    "#{number} - #{first_name} #{last_name} #{suffix}"
  end

  def full_name
    "#{first_name} #{last_name} #{suffix}"
  end

  


  
end
