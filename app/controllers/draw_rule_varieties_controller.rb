class DrawRuleVarietiesController < ApplicationController
  before_action :set_draw_rule_variety, only: [:show, :edit, :update, :destroy]

  # GET /draw_rule_varieties
  # GET /draw_rule_varieties.json
  def index
    @draw_rule_varieties = DrawRuleVariety.all
  end

  # GET /draw_rule_varieties/1
  # GET /draw_rule_varieties/1.json
  def show
  end

  # GET /draw_rule_varieties/new
  def new
    @draw_rule_variety = DrawRuleVariety.new
  end

  # GET /draw_rule_varieties/1/edit
  def edit
  end

  # POST /draw_rule_varieties
  # POST /draw_rule_varieties.json
  def create
    @draw_rule_variety = DrawRuleVariety.new(draw_rule_variety_params)

    respond_to do |format|
      if @draw_rule_variety.save
        format.html { redirect_to @draw_rule_variety, notice: 'Draw rule type was successfully created.' }
        format.json { render :show, status: :created, location: @draw_rule_variety }
      else
        format.html { render :new }
        format.json { render json: @draw_rule_variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_rule_varieties/1
  # PATCH/PUT /draw_rule_varieties/1.json
  def update
    respond_to do |format|
      if @draw_rule_variety.update(draw_rule_variety_params)
        format.html { redirect_to @draw_rule_variety, notice: 'Draw rule type was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_rule_variety }
      else
        format.html { render :edit }
        format.json { render json: @draw_rule_variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draw_rule_varieties/1
  # DELETE /draw_rule_varieties/1.json
  def destroy
    @draw_rule_variety.destroy
    respond_to do |format|
      format.html { redirect_to draw_rule_varieties_url, notice: 'Draw rule type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draw_rule_variety
      @draw_rule_variety = DrawRuleVariety.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draw_rule_variety_params
      params.require(:draw_rule_variety).permit(:description, :variety)
    end
end
