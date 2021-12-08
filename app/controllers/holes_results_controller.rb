class HolesResultsController < ApplicationController
  before_action :set_holes_result, only: [:show, :edit, :update, :destroy]

  # GET /holes_results
  def index
    @holes_results = HolesResult.all
  end

  # GET /holes_results/1
  def show
  end

  # GET /holes_results/new
  def new
    @holes_result = HolesResult.new
  end

  # GET /holes_results/1/edit
  def edit
  end

  # POST /holes_results
  def create
    @holes_result = HolesResult.new(holes_result_params)

    if @holes_result.save
      redirect_to @holes_result, notice: 'Holes result was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /holes_results/1
  def update
    if @holes_result.update(holes_result_params)
      redirect_to @holes_result, notice: 'Holes result was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /holes_results/1
  def destroy
    @holes_result.destroy
    redirect_to holes_results_url, notice: 'Holes result was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holes_result
      @holes_result = HolesResult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def holes_result_params
      params.require(:holes_result).permit(:round_id, :hole_number, :number_of_strokes)
    end
end
