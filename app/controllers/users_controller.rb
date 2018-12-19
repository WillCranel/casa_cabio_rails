class UsersController < ApplicationController

  def index
    @users = User.all
  end

	def show
    @u = User.find(params[:id])
  end

  def new
    @u = User.new
  end

  def create
    @u = User.new(user_params)
    if @u.save
      redirect_to @u
    else
      render :new
    end
  end

  def edit
    @u = User.find(params[:id])
  end

  def update
    @u = User.find(params[:id])
    if @u.update(user_params)
      redirect_to @u
      else
        render :edit
      end
  end

  def user_params
    params.require(:user).permit(:name, :email, :cpf)
  end
end