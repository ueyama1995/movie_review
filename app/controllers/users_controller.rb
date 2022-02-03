class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
     redirect_to users_my_page_path
     flash[:notice] = "会員情報を更新しました。"
    end
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
   def user_params
    params.require(:user).permit(:last_name,:first_name,:nickname,:email)
   end

end
