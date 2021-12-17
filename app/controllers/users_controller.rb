class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def check
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    redirect_to users_my_page_path
    end
  end
  
  private
   def review_params
    params.require(:user).permit(:last_name,)
   end
  
end
