class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Awesome, your profile has been updated.'
      redirect_to current_user
    else
      flash[:warning] = 'Whoops, something went wrong. Try again.'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update(status: 'Disabled')
      flash[:warning] = 'Your account has been disabled.'
      redirect_to root_path
    end
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
