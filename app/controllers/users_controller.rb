# frozen_string_literal: true

class UsersController < ApplicationController

  # ログインをしていなかった場合、指定のページに飛ばすbefore_actionをskipするため。
  skip_before_action :require_login, only:%i[new create]

  def new
    @user = User.new
    render json: { message: "hello" }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
