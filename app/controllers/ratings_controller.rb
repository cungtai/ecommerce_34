class RatingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update]
  before_action :load_rate, only: :update

  def create; end

  def update; end

  private
  def rating_params
    params.require(:rating).permit :score, :product_id, :user_id
  end

  def load_rate
    @rating = current_user.ratings.find_by id: params[:id]
    unless @rating
      flash[:danger] = t "error.rating_not_found"
      redirect_to root_url
    end
  end
end
