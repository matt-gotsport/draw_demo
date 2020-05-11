class DrawStepVarietiesController < ApplicationController
  before_action :set_draw_step_variety, only: [:show, :edit, :update, :destroy]

  # GET /draw_step_varieties
  # GET /draw_step_varieties.json
  def index
    @draw_step_varieties = DrawStepVariety.all
  end

  # GET /draw_step_varieties/1
  # GET /draw_step_varieties/1.json
  def show
  end

  # GET /draw_step_varieties/new
  def new
    @draw_step_variety = DrawStepVariety.new
  end

  # GET /draw_step_varieties/1/edit
  def edit
  end

  # POST /draw_step_varieties
  # POST /draw_step_varieties.json
  def create
    @draw_step_variety = DrawStepVariety.new(draw_step_variety_params)

    respond_to do |format|
      if @draw_step_variety.save
        format.html { redirect_to @draw_step_variety, notice: 'Draw step type was successfully created.' }
        format.json { render :show, status: :created, location: @draw_step_variety }
      else
        format.html { render :new }
        format.json { render json: @draw_step_variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_step_varieties/1
  # PATCH/PUT /draw_step_varieties/1.json
  def update
    respond_to do |format|
      if @draw_step_variety.update(draw_step_variety_params)
        format.html { redirect_to @draw_step_variety, notice: 'Draw step type was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_step_variety }
      else
        format.html { render :edit }
        format.json { render json: @draw_step_variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draw_step_varieties/1
  # DELETE /draw_step_varieties/1.json
  def destroy
    @draw_step_variety.destroy
    respond_to do |format|
      format.html { redirect_to draw_step_varieties_url, notice: 'Draw step type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draw_step_variety
      @draw_step_variety = DrawStepVariety.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draw_step_variety_params
      params.require(:draw_step_variety).permit(:description, :variety, :allow_free_selection, :allow_team_selection, :allow_group_selection)
    end
end
