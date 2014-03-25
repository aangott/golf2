class StatsController < ApplicationController

  def rankings
    @players_by_flight = Player.players_by_flight
    @last_match = Match.last_scored_match
  end

  def history
    @players_by_flight = Player.players_by_flight
  end
  
end
