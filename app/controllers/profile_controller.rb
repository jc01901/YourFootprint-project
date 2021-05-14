class ProfileController < ApplicationController
  def profile
    @users = User.all
  end

  def edit
    @users = User.all
  end

  def change_password
  end
end


