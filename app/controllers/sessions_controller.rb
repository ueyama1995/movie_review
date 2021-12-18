class SessionsController < ApplicationController
  protected

    #def after_sign_in_path_for(resource)
      # binding.pry
      #users_my_page_path
   # end

  def reject_user
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user 
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
end
