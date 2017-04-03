class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to '/'
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      ExampleMailer.sample_email(@user).deliver
      redirect_to '/'
    else
      render :new
  	end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :file, :filename, :contenttype, :filecontents)
    end
end
