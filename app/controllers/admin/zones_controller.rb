class Admin::ZonesController < ::Admin::BaseController
  before_action :set_admin_zone, only: [:show, :edit, :update, :destroy, :upload_person_overall, :upload_team_overall]
  before_action :set_file, only: [:upload_team_overall, :upload_person_overall]

  def import
    Zone.import(params[:file])
    flash[:notice] = "Zone list updated"
    redirect_to admin_zones_path
  end

  # GET /admin/zones
  # GET /admin/zones.json
  def index
    @admin_zones = Zone.all.order(name: :asc)
  end

  # GET /admin/zones/1
  # GET /admin/zones/1.json
  def show
  end

  # GET /admin/zones/new
  def new
    @admin_zone = Zone.new
  end

  # GET /admin/zones/1/edit
  def edit
  end

  # POST /admin/zones
  # POST /admin/zones.json
  def create
    @admin_zone = Zone.new(admin_zone_params)

    respond_to do |format|
      if @admin_zone.save
        format.html { redirect_to @admin_zone_path, notice: 'Zone was successfully created.' }
        format.json { render :show, status: :created, location: @admin_zone }
      else
        format.html { render :new }
        format.json { render json: @admin_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/zones/1
  # PATCH/PUT /admin/zones/1.json
  def update
    respond_to do |format|
      if @admin_zone.update(admin_zone_params)
        format.html { redirect_to admin_zone_path(@admin_zone), notice: 'Zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_zone }
      else
        format.html { render :edit }
        format.json { render json: @admin_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/zones/1
  # DELETE /admin/zones/1.json
  def destroy
    @admin_zone.destroy
    respond_to do |format|
      format.html { redirect_to admin_zones_url, notice: 'Zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_team_overall
    flash[:notice] = @admin_zone.upload_team_overall(@file) ? 'file uploaded' : 'error uploading file'
    redirect_to admin_zones_path
  end

  def upload_person_overall
    flash[:notice] = @admin_zone.upload_person_overall(@file) ? 'file uploaded' : 'error uploading file'
    redirect_to admin_zones_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_zone
    @admin_zone = Zone.find(params[:id])
  end

  def set_file
    @file = params[:file]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_zone_params
    params.require(:zone).permit(:name, :league, :rep, :rep_club, :team_overall_url, :person_overall_url, club_ids: [])
  end
end
