class DrawDefinitionsController < ApplicationController
  before_action :set_locals, only: [:show, :edit, :update, :destroy, :update_sequence]

  # GET /draw_definitions
  # GET /draw_definitions.json
  def index
    @draw_definitions = DrawDefinition.all
  end

  # GET /draw_definitions/1
  # GET /draw_definitions/1.json
  def show
  end

  # GET /draw_definitions/new
  def new
    @draw_definition = DrawDefinition.new
  end

  # GET /draw_definitions/1/edit
  def edit
  end

  # POST /draw_definitions
  # POST /draw_definitions.json
  def create
    success,@draw_definition = get_service.create_draw_definition(draw_definition_params)

    respond_to do |format|
      if success
        format.html { redirect_to @draw_definition, notice: 'Draw definition was successfully created.' }
        format.json { render :show, status: :created, location: @draw_definition }
      else
        format.html { render :new }
        format.json { render json: @draw_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_definitions/1
  # PATCH/PUT /draw_definitions/1.json
  def update
    respond_to do |format|
      if @draw_definition.update(draw_definition_params)
        format.html { redirect_to @draw_definition, notice: 'Draw definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_definition }
      else
        format.html { render :edit }
        format.json { render json: @draw_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_definitions/1/update_sequence?draw_stage_id=2
  def update_sequence
    success = self.get_service.update_sequence(@draw_definition, params[:draw_stage_definition_id])
    
    respond_to do |format|
      if success    
        format.html { redirect_to @draw_definition, notice: 'Draw definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_definition }
      else
        format.html { render :edit }
        format.json { render json: @draw_definition.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /draw_definitions/1
  # DELETE /draw_definitions/1.json
  def destroy
    @draw_definition.destroy
    respond_to do |format|
      format.html { redirect_to draw_definitions_url, notice: 'Draw definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locals
      self.set_draw_definition
      self.set_draw_stage_definitions
    end

    def set_draw_definition
      @draw_definition = DrawDefinition.find(params[:id])
    end

    def set_draw_stage_definitions
      @draw_stage_definitions = self.get_service.get_draw_stage_defintions(@draw_definition)
    end

    # Only allow a list of trusted parameters through.
    def draw_definition_params
      if params.has_key?(:draw_definition)
        params.require(:draw_definition).permit(:name,:output_group_name,:output_group_count,:output_group_size)
      else
        params.permit(:draw_stage_definition_id)
      end 
    end

    def get_service
      return Services::DrawDefinitionService.new
    end
end
