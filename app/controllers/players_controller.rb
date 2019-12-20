class PlayersController < ApplicationController

  def import
    Player.import(params[:file])
    flash[:notice] = "Player list updated"
    redirect_to players_path
  end

  def index
    @issues = Player.where(club_id: nil)
    @players = Player.all
  end

end
