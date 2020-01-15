class User::TeamSheetsController < ::User::BaseController
  before_action :set_team_sheet, only: [:show, :edit, :update]

  # GET /user/team_sheets/1
  # GET /user/team_sheets/1.json
  def show
  end

  # GET /user/team_sheets/new
  def new
    @zone = Zone.find(params[:zone_id])
    @fixture = Fixture.find(params[:fixture_id])
    @team_sheet = TeamSheet.new
    @players = current_user.club.players
  end

  # GET /user/team_sheets/1/edit
  def edit
  end

  # POST /user/team_sheets
  # POST /user/team_sheets.json
  def create
    @team_sheet = TeamSheet.new(team_sheet_params)
    respond_to do |format|
      if @team_sheet.save
        format.html { redirect_to user_team_sheet_path(@team_sheet), notice: 'Team sheet was successfully created.' }
        format.json { render :show, status: :created, location: @team_sheet }
      else
        format.html { render :new }
        format.json { render json: @team_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/team_sheets/1
  # PATCH/PUT /user/team_sheets/1.json
  def update
    respond_to do |format|
      if @team_sheet.update(team_sheet_params)
        format.html { redirect_to team_sheet_path(@team_sheet), notice: 'Team sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_sheet }
      else
        format.html { render :edit }
        format.json { render json: @team_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_team_sheet
    @team_sheet = TeamSheet.find(params[:id])
  end

  def team_sheet_params
    params.require(:team_sheet).permit(:fixture_id,
                                       :club_id,
                                       :player_1,
                                       :player_2,
                                       :player_3,
                                       :player_4,
                                       :player_5,
                                       :player_6,
                                       :player_7,
                                       :player_8,
                                       :guest_1,
                                       :guest_2,
                                       :guest_3)
  end

end
