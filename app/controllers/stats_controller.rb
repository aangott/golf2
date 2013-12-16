class StatsController < ApplicationController

  def rankings
    flights = ['1', '2', 'Sub']
    @data = {}
    flights.each do |flight|
      players = Player.where("flight = ?", flight)

      players.each do |player|
        


      end


      @data[flight] = players
    end

  end

end
