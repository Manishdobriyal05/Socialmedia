class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  # def new
  #   @user = User.new
  # end

  def login
  end

  def create
    @user = User.find_by(username: params[:username])
    # session[:id] = @user.id unless session[:user_id] 
    session[:user_id] = @user.id 
    if @user && @user.authenticate(params[:password])
      redirect_to '/posts'
    else
      redirect_to '/login'
      # flash[:danger] = 'invalid username and password'
      # flash[:alert] = 'invalid username and password'
      # render "new"
    end
  end

  def welcome
  end

  def page_requires_login
  end

  def destroy
    # @user = User.find_by(params[:username])
    # if @user.present?
    session[:user_id] = nil
      # @user.destroy
    # end
    redirect_to '/login'
  end
  
end
