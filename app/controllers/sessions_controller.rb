class SessionsController < ApplicationController
  def login_form; end

  def login
    user = Users.find_by_name(params[:name])

    if user
      # already exists
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing #{ user.name }"
      # redirect_to root_path
      redirect_to works_path
    else
      # create new user
      user = User.new
      flash[:success] = "Successfully created new user #{ user.name } with ID #{}"
      render :login_form
    end
  end

  def logout
    #session[:author_id] = nil
    session.delete(:user_id)
    flash[:success] = "Successfully logged out"
    # redirect_to root_path
    redirect_to works_path
  end
end
