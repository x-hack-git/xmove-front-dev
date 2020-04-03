# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :require_login

  protected

  def not_authenticated
    redirect_to sign_in_path
  end
end
