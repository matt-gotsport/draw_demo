class DrawStageDefinitionsController < ApplicationController
  before_action :set_locals, only: [:show, :edit, :update, :destroy, :update_sequence]

  # GET /draw_stage_definitions
  # GET /draw_stage_definitions.json
  def index
    @draw_stage_definitions = DrawStageDefinition.all
  end

  # GET /draw_stage_definitions/1
  # GET /draw_stage_definitions/1.json
  def show
  end

  # GET /draw_stage_definitions/new
  def new
    @draw_stage_definition = DrawStageDefinition.new
  end

  # GET /draw_stage_definitions/1/edit
  def edit
  end

  # POST /draw_stage_definitions
  # POST /draw_stage_definitions.json
  def create
    @draw_stage_definition = DrawStageDefinition.new(draw_stage_definition_params)
    @draw_stage_definition.draw_stage_sequence = self.get_draw_definition_service.create_draw_stage_sequence(@draw_stage_definition)

    respond_to do |format|
      if @draw_stage_definition.save
        format.html { redirect_to @draw_stage_definition, notice: 'Draw stage definition was successfully created.' }
        format.json { render :show, status: :created, location: @draw_stage_definition }
      else
        format.html { render :new }
        format.json { render json: @draw_stage_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_stage_definitions/1
  # PATCH/PUT /draw_stage_definitions/1.json
  def update
    respond_to do |format|
      if @draw_stage_definition.update(draw_stage_definition_params)
        format.html { redirect_to @draw_stage_definition, notice: 'Draw stage definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_stage_definition }
      else
        format.html { render :edit }
        format.json { render json: @draw_stage_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_stage_definitions/1/update_sequence?draw_step_id=2
  def update_sequence
    respond_to do |format|
      begin
        self.get_draw_step_service.update_sequence(@draw_stage_definition, params[:draw_step_id])
        format.html { redirect_to @draw_stage_definition, notice: 'Draw stage definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_stage_definition }
      rescue
        format.html { redirect_to @draw_stage_definition, notice: 'Error' }
        format.json { render json: @draw_stage_definition.errors, status: :unprocessable_entity }
        raise
      end     
    end
  end

  # DELETE /draw_stage_definitions/1
  # DELETE /draw_stage_definitions/1.json
  def destroy
    @draw_stage_definition.destroy
    respond_to do |format|
      format.html { redirect_to draw_stage_definitions_url, notice: 'Draw stage definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locals
      self.set_draw_stage_definition
      self.set_draw_steps
    end

    def set_draw_stage_definition
      @draw_stage_definition = DrawStageDefinition.find(params[:id])
    end

    def set_draw_steps
      @draw_steps = self.get_draw_step_service.get_draw_steps(@draw_stage_definition)
    end

    # Only allow a list of trusted parameters through.
    def draw_stage_definition_params
      if params.has_key?(:draw_stage_definition)
        params.require(:draw_stage_definition).permit(:draw_definition_id, :name, :group_id)
      else
        params.permit(:draw_step_id)
      end 
    end

    def get_draw_definition_service
      return Services::DrawDefinitionService.new
    end 

    def get_draw_step_service
      return Services::DrawStepService.new
    end
end
