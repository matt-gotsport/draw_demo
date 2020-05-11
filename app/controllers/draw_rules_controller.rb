class DrawRulesController < ApplicationController
  before_action :set_draw_rule, only: [:show, :edit, :update, :update_steps, :update_groups, :destroy]

  # GET /draw_rules
  # GET /draw_rules.json
  def index
    @draw_rules = DrawRule.all
  end

  # GET /draw_rules/1
  # GET /draw_rules/1.json
  def show
  end

  # GET /draw_rules/new
  def new
    @draw_rule = DrawRule.new
  end

  # GET /draw_rules/1/edit
  def edit
  end

  # POST /draw_rules
  # POST /draw_rules.json
  def create
    @draw_rule = DrawRule.new(draw_rule_params)

    respond_to do |format|
      if @draw_rule.save
        format.html { redirect_to @draw_rule, notice: 'Draw rule was successfully created.' }
        format.json { render :show, status: :created, location: @draw_rule }
      else
        format.html { render :new }
        format.json { render json: @draw_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_rules/1
  # PATCH/PUT /draw_rules/1.json
  def update
    respond_to do |format|
      if @draw_rule.update(draw_rule_params)
        format.html { redirect_to @draw_rule, notice: 'Draw rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_rule }
      else
        format.html { render :edit }
        format.json { render json: @draw_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_rules/1/update_steps?draw_stage_definition_id=2
  # PATCH/PUT /draw_rules/1.json
  def update_steps
    stage_def_id = draw_rule_range_params[:draw_stage_definition_id]
    step_ids = draw_rule_range_params[:draw_step_ids]
    success = get_service.update_rule_steps(@draw_rule, stage_def_id, step_ids)
    respond_to do |format|
      if success
        format.html { redirect_to @draw_rule, notice: 'Draw rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_rule }
      else
        format.html { render :edit }
        format.json { render json: @draw_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_rules/1/draw_groups
  def update_groups
    group_ids = draw_rule_range_params[:group_ids]
    success = get_service.update_rule_groups(@draw_rule, group_ids)
    respond_to do |format|
      if success
        format.html { redirect_to @draw_rule, notice: 'Draw rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_rule }
      else
        format.html { render :edit }
        format.json { render json: @draw_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draw_rules/1
  # DELETE /draw_rules/1.json
  def destroy
    @draw_rule.destroy
    respond_to do |format|
      format.html { redirect_to draw_rules_url, notice: 'Draw rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draw_rule
      @draw_rule = DrawRule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draw_rule_params
      params.require(:draw_rule).permit(:draw_definition_id, :draw_rule_variety_id, :group_name, :quantity)
    end

    def draw_rule_range_params
      params.require(:draw_rule).permit(:draw_stage_definition_id, draw_step_ids: [], group_ids:[])
    end  

    def get_service
      return Services::DrawRuleService.new
    end
end
