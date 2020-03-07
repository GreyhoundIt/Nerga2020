class Admin::FixturesController < ::Admin::BaseController
  before_action :set_admin_fixture, only: [:show, :edit, :update, :destroy ]
  before_action :set_uploaded_params, only: [:upload_skeleton_start_sheet, :upload_start_sheet, :upload_person_overall, :upload_team_overall]

  def import
    Fixture.import(params[:file])
    flash[:notice] = 'Fixture list updated'
    redirect_to admin_fixtures_path
  end

  # GET /admin/fixtures
  # GET /admin/fixtures.json
  def index
    @admin_fixtures = Fixture.all.order(:zone_name, start_time: :asc)
  end

  # GET /admin/fixtures/1
  # GET /admin/fixtures/1.json
  def show
  end

  # GET /admin/fixtures/new
  def new
    @admin_fixture = Fixture.new
  end

  # GET /admin/fixtures/1/edit
  def edit
  end

  # POST /admin/fixtures
  # POST /admin/fixtures.json
  def create
    @admin_fixture = Fixture.new(admin_fixture_params)

    respond_to do |format|
      if @admin_fixture.save
        format.html { redirect_to @admin_fixture_path, notice: 'Fixture was successfully created.' }
        format.json { render :show, status: :created, location: @admin_fixture }
      else
        format.html { render :new }
        format.json { render json: @admin_fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/fixtures/1
  # PATCH/PUT /admin/fixtures/1.json
  def update
    respond_to do |format|
      if @admin_fixture.update(admin_fixture_params)
        format.html { redirect_to admin_fixture_path(@admin_fixture), notice: 'Fixture was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_fixture }
      else
        format.html { render :edit }
        format.json { render json: @admin_fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/fixtures/1
  # DELETE /admin/fixtures/1.json
  def destroy
    @admin_fixture.destroy
    respond_to do |format|
      format.html { redirect_to admin_fixtures_url, notice: 'Fixture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_fixture_teamsheet
    fixture = Fixture.find(params[:fixture_id])
    send_data fixture.get_fixture_teamsheet, filename: "#{fixture.zone_name}#{fixture.home_club}.csv"
  end

  def upload_skeleton_start_sheet
    @fixture.upload_skeleton_start_sheet(@file)
    flash[:notice] = 'file uploaded'
    redirect_to admin_fixtures_path
  end

  def upload_start_sheet
    @fixture.upload_start_sheet(@file)
    flash[:notice] = 'file uploaded'
    redirect_to admin_fixtures_path
  end

  def upload_team_overall
    @fixture.upload_team_overall(@file)
    flash[:notice] = 'file uploaded'
    redirect_to admin_fixtures_path
  end

  def upload_person_overall
    @fixture.upload_person_overall(@file)
    flash[:notice] = 'file uploaded'
    redirect_to admin_fixtures_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_fixture
    @admin_fixture = Fixture.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_fixture_params
    params.require(:fixture).permit(:zone_id, :zone_name, :start_time, :home_club, :bye_teams, :start_sheet_skeleton, :start_sheet_official, :team_overall, :person_overall)
  end

  def set_uploaded_params
    @file = params[:file]
    @fixture = Fixture.find(params[:fixture_id])
  end
end
