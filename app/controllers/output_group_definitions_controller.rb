class OutputGroupDefinitionsController < ApplicationController
  before_action :set_output_group_definition, only: [:show, :edit, :update, :destroy]

  # GET /output_group_definitions
  # GET /output_group_definitions.json
  def index
    @output_group_definitions = OutputGroupDefinition.all
  end

  # GET /output_group_definitions/1
  # GET /output_group_definitions/1.json
  def show
  end

  # GET /output_group_definitions/new
  def new
    @output_group_definition = OutputGroupDefinition.new
  end

  # GET /output_group_definitions/1/edit
  def edit
  end

  # POST /output_group_definitions
  # POST /output_group_definitions.json
  def create
    @output_group_definition = OutputGroupDefinition.new(output_group_definition_params)

    respond_to do |format|
      if @output_group_definition.save
        format.html { redirect_to @output_group_definition, notice: 'Output group definition was successfully created.' }
        format.json { render :show, status: :created, location: @output_group_definition }
      else
        format.html { render :new }
        format.json { render json: @output_group_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /output_group_definitions/1
  # PATCH/PUT /output_group_definitions/1.json
  def update
    respond_to do |format|
      if @output_group_definition.update(output_group_definition_params)
        format.html { redirect_to @output_group_definition, notice: 'Output group definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @output_group_definition }
      else
        format.html { render :edit }
        format.json { render json: @output_group_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /output_group_definitions/1
  # DELETE /output_group_definitions/1.json
  def destroy
    @output_group_definition.destroy
    respond_to do |format|
      format.html { redirect_to output_group_definitions_url, notice: 'Output group definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_output_group_definition
      @output_group_definition = OutputGroupDefinition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def output_group_definition_params
      params.require(:output_group_definition).permit(:draw_definition_id, :name, :size, :sequence)
    end
end
