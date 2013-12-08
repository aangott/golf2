class Score < ActiveRecord::Base
  attr_accessible :adjusted, :player_id, :value

  belongs_to :player

end
