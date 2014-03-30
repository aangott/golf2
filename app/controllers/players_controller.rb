class PlayersController < ApplicationController
  before_filter :authenticate

  def index
    @players = Player.ordered_by_number
  end


  def new
    @player = Player.new
  end


  def create
    @player = Player.new(params[:player])
    if @player.save
      flash[:success] = 'Player successfully added.'
      redirect_to players_path
    else
      render :action => 'new'
    end
  end


  def edit
    @player = Player.find(params[:id])
  end


  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(params[:player])
      flash[:success] = 'Player information successfully updated.'
      redirect_to players_path
    else
      render :action => 'edit'
    end   
  end


  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:success] = 'Player successfully deleted.'
    redirect_to players_path
  end


end
