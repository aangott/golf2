class StatsController < ApplicationController

  def rankings
    @players_by_flight = Player.players_by_flight
  end

  def history
    @players_by_flight = Player.players_by_flight
  end
  
end
