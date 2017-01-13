class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to '/'
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      redirect_to '/'
    else
      render :new
  	end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
