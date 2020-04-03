# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(mypage_path, notice: 'login successful!')
    else
      flash.now[:alert] = 'login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end