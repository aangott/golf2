class RoundsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  def index
    @rounds = Round.order('date')
  end

  def show
    @round = Round.find(params[:id])
  end

  def new
    @round = Round.new
    # create the matches that comprise the round
    Round.matches_per_round().times do
      @round.matches.build()
    end
  end


  def create
    @round = Round.new(params[:round])

    @round.matches.each do |match|
      match.score1 = Score.new
      match.score2 = Score.new
      match.points1 = Point.new
      match.points2 = Point.new
    end

    if @round.save
      flash[:success] = 'New round successfully created.'
      redirect_to rounds_path
    else
      render :action => 'new'
    end
  end


  def edit
    @round = Round.find(params[:id])
  end


  def update
    @round = Round.find(params[:id])

    if @round.is_in_past?
      @round.matches.each do |match|
        match.score1.player_id = match.player1 ? match.player1.id : nil
        match.score2.player_id = match.player2 ? match.player2.id : nil 
        match.points1.player_id = match.player1 ? match.player1.id : nil
        match.points2.player_id = match.player2 ? match.player2.id : nil
      end
    end

    if @round.update_attributes(params[:round])
      flash[:success] = 'Round information successfully updated.'
      redirect_to rounds_path
    else
      render :action => 'edit'
    end
  end


  def destroy
    @round = Round.find(params[:id])
    @round.destroy
    flash[:success] = 'Round successfully deleted.'
    redirect_to rounds_path
  end

end
