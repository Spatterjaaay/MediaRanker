class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    render_404 if !@user
  end
end
