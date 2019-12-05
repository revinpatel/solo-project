class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by_id(params[:id])
    return render_not_found if @user.blank?
    @characters = Character.where(user_id: params[:id])
  end

  private

  def render_not_found
    render plain: 'Not Found :(', status: :not_found
  end
  
end
