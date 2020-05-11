class DrawOutputGroupsController < ApplicationController
  before_action :set_draw_output_group, only: [:show, :edit, :update, :destroy]

  # GET /draw_output_groups
  # GET /draw_output_groups.json
  def index
    @draw_output_groups = DrawOutputGroup.all
  end

  # GET /draw_output_groups/1
  # GET /draw_output_groups/1.json
  def show
  end

  # GET /draw_output_groups/new
  def new
    @draw_output_group = DrawOutputGroup.new
  end

  # GET /draw_output_groups/1/edit
  def edit
  end

  # POST /draw_output_groups
  # POST /draw_output_groups.json
  def create
    @draw_output_group = DrawOutputGroup.new(draw_output_group_params)

    respond_to do |format|
      if @draw_output_group.save
        format.html { redirect_to @draw_output_group, notice: 'Draw output group was successfully created.' }
        format.json { render :show, status: :created, location: @draw_output_group }
      else
        format.html { render :new }
        format.json { render json: @draw_output_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draw_output_groups/1
  # PATCH/PUT /draw_output_groups/1.json
  def update
    respond_to do |format|
      if @draw_output_group.update(draw_output_group_params)
        format.html { redirect_to @draw_output_group, notice: 'Draw output group was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw_output_group }
      else
        format.html { render :edit }
        format.json { render json: @draw_output_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draw_output_groups/1
  # DELETE /draw_output_groups/1.json
  def destroy
    @draw_output_group.destroy
    respond_to do |format|
      format.html { redirect_to draw_output_groups_url, notice: 'Draw output group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draw_output_group
      @draw_output_group = DrawOutputGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def draw_output_group_params
      params.require(:draw_output_group).permit(:size)
    end
end
