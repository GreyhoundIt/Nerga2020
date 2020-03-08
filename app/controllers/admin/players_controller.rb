class Admin::PlayersController < ::Admin::BaseController

  def import
    Player.import(params[:file])
    flash[:notice] = "Player list updated"
    redirect_to admin_players_path
  end

  def remove_orphaned_players
    Player.remove_orphaned_players
    flash[:notice] = "Player List Cleaned up"
    redirect_to admin_players_path
  end

  def index
    @issues = Player.no_club
    @players = Player.ordered
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    respond_to do |format|
      format.html { redirect_to admin_players_url, notice: 'Player was successfully removed.' }
      format.json { head :no_content }
    end
  end

end
