class Point < ActiveRecord::Base
  attr_accessible :player_id, :value

  belongs_to :player

end
