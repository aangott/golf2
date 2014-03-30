class StatsController < ApplicationController

  def rankings
    players_by_flight = Player.players_by_flight
    @players_by_flight_points = {}
    players_by_flight.each do |flight, players|
      @players_by_flight_points[flight] = players.sort_by { |player| player.total_points }.reverse
    end
    @last_round = Round.last_scored_round
  end

  def history
    @players_by_flight = Player.players_by_flight
  end
  
end
