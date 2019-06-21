module UsersHelper
  def is_following(user)
    user.followers.pluck(:id).include?(current_user.id)
  end
end
