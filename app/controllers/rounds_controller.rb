class RoundsController < ApplicationController


  def index
    @rounds = Round.all
  end


  def new
    @round = Round.new
    # create the matches that comprise the round
    4.times do
      @round.matches.build(:score1 => Score.new,
                           :score2 => Score.new)
    end
  end


  def create
    @round = Round.new(params[:round])

    @round.matches.each do |match|
      match.score1.player_id = match.player1.id
      match.score2.player_id = match.player2.id
    end

    if @round.save
      redirect_to rounds_path, :notice => 'New round successfully created.'
    else
      render :action => 'new'
    end
  end


  def edit
    @round = Round.find(params[:id])
  end


  def update
    @round = Round.find(params[:id])

    @round.matches.each do |match|
      match.score1.player_id = match.player1.id
      match.score2.player_id = match.player2.id
    end

    if @round.update_attributes(params[:round])
      redirect_to rounds_path, :notice => 'Round information successfully updated.'
    else
      render :action => 'edit'
    end
  end


end
