class DrawStagesController < ApplicationController
  before_action :set_draw_stage, only: [:show, :edit, :update, :destroy]

  # GET /draw_stages
  # GET /draw_stages.json
  def index
    @draw_stages = DrawStage.all
  end

  # GET /draw_stages/1
  # GET /draw_stages/1.json
  def show
  end

  # GET /draw_stages/new
  def new
    @draw_stage = DrawStage.new
  end

  # GET /draw_stages/1/edit
  def edit
  end

  # POST /draw_stages
  # POST /draw_stages.json
  def create
    @draw_stage = DrawStage.new(draw_stage_params)

    respond_to do |format|
      if @draw_stage.save
        format.html { redirect_to @draw_stage, notice: 'Draw stage was successfully created.' }
        format.json { render :show, status: :created, location: @draw_stage }
      else
        format.html { render :new }
        format.json { render json: @draw_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_stages/1
  # PATCH/PUT /draw_stages/1.json
  def update
    respond_to do |format|
      if @draw_stage.update(draw_stage_params)
        format.html { redirect_to @draw_stage, notice: 'Draw stage was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_stage }
      else
        format.html { render :edit }
        format.json { render json: @draw_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draw_stages/1
  # DELETE /draw_stages/1.json
  def destroy
    @draw_stage.destroy
    respond_to do |format|
      format.html { redirect_to draw_stages_url, notice: 'Draw stage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draw_stage
      @draw_stage = DrawStage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draw_stage_params
      params.require(:draw_stage).permit(:draw_stage_definition_id, :draw_step_id, :group_id)
    end
end
