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




  def history
    @players_by_flight = {}
    @players_by_flight['First Flight'] = Player.where(:flight => '1')
    @players_by_flight['Second Flight'] = Player.where(:flight => '2')  
    @players_by_flight['Substitutes'] = Player.where(:flight => 'Sub')
  end
  




end
