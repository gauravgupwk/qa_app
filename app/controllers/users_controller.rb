class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def profile
    @questions = @user.questions
  end

  def follow
    follow = current_user.follow.create(following_id: @user.id)
  end

  def unfollow
    current_user.follow.where(following_id: @user.id).destroy_all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
