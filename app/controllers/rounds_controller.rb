class RoundsController < ApplicationController
  before_action :current_user_must_be_round_user,
                only: %i[edit update destroy]

  before_action :set_round, only: %i[show edit update destroy]

  def index
    @q = Round.ransack(params[:q])
    @rounds = @q.result(distinct: true).includes(:user, :course,
                                                 :holes_results).page(params[:page]).per(10)
  end

  def show
    @holes_result = HolesResult.new
  end

  def new
    @round = Round.new
  end

  def edit; end

  def create
    @round = Round.new(round_params)

    if @round.save
      message = "Round was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @round, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @round.update(round_params)
      redirect_to @round, notice: "Round was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @round.destroy
    message = "Round was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to rounds_url, notice: message
    end
  end

  private

  def current_user_must_be_round_user
    set_round
    unless current_user == @round.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(:course_id, :user_id, :score, :best_hole,
                                  :worst_hole, :reason_wonlost, :best_hole_description, :worst_hole_description)
  end
end
