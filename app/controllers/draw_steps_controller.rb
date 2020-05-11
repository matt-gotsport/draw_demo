class DrawStepsController < ApplicationController
  before_action :set_draw_step, only: [:show, :edit, :update, :update_groups, :destroy]
  before_action :set_draw_output_groups, only: [:edit,:update,:update_groups]

  # GET /draw_steps
  # GET /draw_steps.json
  def index
    @draw_steps = DrawStep.all
  end

  # GET /draw_steps/1
  # GET /draw_steps/1.json
  def show
  end

  # GET /draw_steps/new
  def new
    @draw_step = DrawStep.new
  end

  # GET /draw_steps/1/edit
  def edit
  end

  # POST /draw_steps
  # POST /draw_steps.json
  def create
    @draw_step = DrawStep.new(draw_step_params)
    @draw_step.draw_step_sequence = self.get_service.create_draw_step_sequence(@draw_step)

    respond_to do |format|
      if @draw_step.save
        format.html { redirect_to @draw_step, notice: 'Draw step was successfully created.' }
        format.json { render :show, status: :created, location: @draw_step }
      else
        format.html { render :new }
        format.json { render json: @draw_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_steps/1
  # PATCH/PUT /draw_steps/1.json
  def update
    respond_to do |format|
      if @draw_step.update(draw_step_params)
        format.html { redirect_to @draw_step, notice: 'Draw step was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_step }
      else
        format.html { render :edit }
        format.json { render json: @draw_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_steps/1/update_groups
  # PATCH/PUT /draw_steps/1.json
  def update_groups
    success = get_service.update_step_groups(@draw_step, draw_step_params[:draw_output_group_definition_ids])

    respond_to do |format|
      if success
        format.html { redirect_to @draw_step, notice: 'Draw step was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_step }
      else
        format.html { render :edit }
        format.json { render json: @draw_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draw_steps/1
  # DELETE /draw_steps/1.json
  def destroy
    @draw_step.destroy
    respond_to do |format|
      format.html { redirect_to draw_steps_url, notice: 'Draw step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draw_step
      @draw_step = DrawStep.find(params[:id])
    end

    def set_draw_output_groups
      @draw_output_groups = @draw_step.draw_stage_definition.draw_definition.draw_output_group_definitions 
    end

    # Only allow a list of trusted parameters through.
    def draw_step_params
      params.require(:draw_step).permit(:draw_stage_definition_id, :draw_step_variety_id, draw_output_group_definition_ids: [])
    end

    def get_service
      return Services::DrawStepService.new
    end
end
