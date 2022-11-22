class UsersController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # def create
    # @user = User.create(params.require(:user).permit(:username, :password, :email))
    # UserMailer.welcome_email(@user).deliver
    # session[:user_id] = @user.id
    # redirect_to '/welcome'
  # end

  def create
    @user = User.create(user_params)
    UserMailer.welcome_email(@user).deliver
    session[:user_id] = @user.id
    if @user.valid?
      @user.save
      redirect_to '/welcome'
    else  
      redirect :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    # redirect_to '/welcome'
    redirect_to '/welcome'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
