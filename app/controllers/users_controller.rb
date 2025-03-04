class UsersController < ApplicationController
  def index; end

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit, status: :internal_server_error }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name)
  end
end
