class Admin::ClubsController < ::Admin::BaseController
  before_action :set_admin_club, only: [:show, :edit, :update, :destroy]

  def import
    Club.import(params[:file])
    flash[:notice] = "Club list updated"
    redirect_to admin_clubs_path
  end

  # GET /admin/clubs
  # GET /admin/clubs.jsonc

  def index
    @admin_clubs = Club.all
  end

  # GET /admin/clubs/1
  # GET /admin/clubs/1.json
  def show
  end

  # GET /admin/clubs/new
  def new
    @admin_club = Club.new
  end

  # GET /admin/clubs/1/edit
  def edit
  end

  # POST /admin/clubs
  # POST /admin/clubs.json
  def create
    @admin_club = Club.new(admin_club_params)

    respond_to do |format|
      if @admin_club.save
        format.html { redirect_to @admin_club_path, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @admin_club }
      else
        format.html { render :new }
        format.json { render json: @admin_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/clubs/1
  # PATCH/PUT /admin/clubs/1.json
  def update
    respond_to do |format|
      if @admin_club.update(admin_club_params)
        format.html { redirect_to admin_club_path(@admin_club), notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_club }
      else
        format.html { render :edit }
        format.json { render json: @admin_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/clubs/1
  # DELETE /admin/clubs/1.json
  def destroy
    @admin_club.destroy
    respond_to do |format|
      format.html { redirect_to admin_clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_club
    @admin_club = Club.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_club_params
    params.require(:club).permit(:name, :postcode, :website, zone_ids: [])
  end
end
