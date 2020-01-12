class Admin::PlayersController < ::Admin::BaseController

  def import
    Player.import(params[:file])
    flash[:notice] = "Player list updated"
    redirect_to admin_players_path
  end

  def index
    @issues = Player.where(club_id: nil)
    @players = Player.all
  end

end
