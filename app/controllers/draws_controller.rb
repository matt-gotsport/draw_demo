class DrawsController < ApplicationController
  before_action :set_draw, only: [:show, :edit, :update, :destroy, :performance, :next_step, :undo_step]
  before_action :set_complete_draw_definitions, only: [:new]
  before_action :set_max_output_group_size, only: [:performance, :next_step, :undo_step]
  before_action :set_draw_step_groups, only: [:performance, :next_step, :undo_step]

  # GET /draws
  # GET /draws.json
  def index
    @draws = Draw.all
  end

  # GET /draws/1
  # GET /draws/1.json
  def show 
  end

  # GET /draws/new
  def new
    @draw = Draw.new
    if draw_definition_id = params[:draw_definition_id]
      @draw.draw_definition = DrawDefinition.find(draw_definition_id)
    end  end

  # GET /draws/1/edit
  def edit
  end

  # POST /draws
  # POST /draws.json
  def create
    success, @draw = self.get_draw_service.create_draw(draw_params[:draw_definition_id])  
    respond_to do |format|
      if success
        format.html { redirect_to @draw, notice: 'Draw was successfully created.' }
        format.json { render :show, status: :created, location: @draw }
      else  
        format.html { render :new }
        format.json { render json: @draw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draws/1
  # PATCH/PUT /draws/1.json
  def update
    respond_to do |format|
      if @draw.update(draw_params)
        format.html { redirect_to @draw, notice: 'Draw was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw }
      else
        format.html { render :edit }
        format.json { render json: @draw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draws/1
  # DELETE /draws/1.json
  def destroy
    @draw.destroy
    respond_to do |format|
      format.html { redirect_to draws_url, notice: 'Draw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /draws/1/performance
  def performance
    @assigned_teams = get_performance_service.get_team_assignment_map(@draw)
    @available_drum_teams,  @unavailable_drum_teams  = get_performance_service.apply_team_rules(@draw)
    @available_drum_groups, @unavailable_drum_groups = get_performance_service.apply_group_rules(@draw)
  end  

  # POST /draws/1/next_step
  def next_step
    success,status_message = get_performance_service.process_step(@draw, step_params[:team_id], step_params[:group_id], step_params[:sequence]) 
    respond_to do |format|
      if success
        format.html { redirect_to performance_draw_path, notice: status_message }
      else
        format.html { redirect_to performance_draw_path, notice: "Error" }
      end
    end
  end

  # POST /draws/1/undo_step
  def undo_step
    success,status_message = get_performance_service.undo_step(@draw) 
    respond_to do |format|
      if success
        format.html { redirect_to performance_draw_path, notice: status_message }
      else
        format.html { redirect_to performance_draw_path, notice: "Error" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locals
      self.set_draw()
    end  

    def set_draw
      @draw = Draw.find(params[:id])
    end
    
    def set_max_output_group_size
      @max_output_group_size = @draw.draw_output_groups.maximum(:size) 
    end
    
    def set_complete_draw_definitions
      @complete_draw_definitions = self.get_draw_service.get_complete_draw_definitions
    end

    def set_draw_step_groups
      @draw_step_groups = get_step_service.get_step_groups(@draw)
    end

    # Only allow a list of trusted parameters through.
    def draw_params
      params.require(:draw).permit(:draw_definition_id, :draw_stage_id)
    end

    def step_params
      params.permit(:authenticity_token, :id, :team_id, :group_id, :sequence)
    end

    def get_draw_service()
      return Services::DrawService.new
    end

    def get_performance_service()
      return Services::PerformanceService.new
    end 

    def get_step_service()
      return Services::DrawStepService.new
    end 
end
