class Score < ActiveRecord::Base
  attr_accessible :adjusted, :player_id, :value

  belongs_to :player

  def ultimate_value
    if self.adjusted
      return self.adjusted
    elsif self.value
      return self.value
    else
      nil
    end
  end









end
