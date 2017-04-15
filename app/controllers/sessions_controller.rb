class SessionsController < ApplicationController
  def login_form; end

  def login
    user = User.find_by_name(params[:name])

    if user
      session[:user_id] = user.id
      session[:user_name] = user.name
      flash[:success] = "Successfully logged in as existing #{ user.name }"
      redirect_to root_path
    else
      user = User.new
      user.name = params[:name]
      user.save
      session[:user_id] = user.id
      session[:user_name] = user.name
      flash[:success] = "Successfully created new user #{ user.name } with ID #{ user.id }"
      redirect_to root_path
    end
  end

  def logout
    session.delete(:user_id)
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
