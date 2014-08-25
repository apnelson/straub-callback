class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, except: [:index, :create, :new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "The user has been successfully updated."
      redirect_to users_path
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "The user has been successfully updated."
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "The user has been deleted."
      redirect_to users_path
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      up = params.require(:user).permit(:name, :email, :password)
      up.delete(:password) if up[:password].blank?
      up
    end

end
