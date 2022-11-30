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

  def create
    @user = User.create(user_params)
    UserMailer.welcome_email(@user).deliver
    session[:user_id] = @user.id
    if @user.valid?
      @user.save
      redirect_to '/welcome', notice: 'User was sucessfully created!'
    else  
      redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/welcome'
  end


  def follow
    # binding.pry
    @user = User.find(params[:id])
    # @current_user.follow_by << @user
    @current_user.followers << @user
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    @current_user.followed_users.find_by(follow_by: @user.id).destroy
    # redirect_back(fallback_location: user_path(@user))
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end



