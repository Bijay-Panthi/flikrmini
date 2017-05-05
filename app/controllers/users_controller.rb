class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def show
    #@user = User.first
    @user = User.find_by(id: params["id"])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params["id"])
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render new #Show the sign up form
      end
  end


  def update
    user = User.find_by(id: params["id"])
    user.update( user_params() )

    redirect_to "/users/#{user.id}"
  end






  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end





end
