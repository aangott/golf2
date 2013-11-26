class PlayersController < ApplicationController


  def index
    @players = Player.all
  end


  def new
    @player = Player.new
  end


  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to players_path, :notice => 'Player successfully added.'
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
      redirect_to players_path, :notice => 'Player information successfully updated.'
    else
      render :action => 'edit'
    end   
  end


  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path, :notice => 'Player successfully deleted.'
  end


end
