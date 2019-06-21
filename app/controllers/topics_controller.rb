class TopicsController < ApplicationController
  before_action :authenticate_user!

  def select_topic
    current_user.topics << Topic.where(id: permit_topics[:topic_ids])
    redirect_to root_path
  end

  private

  def permit_topics
    params.require(:topic).permit(topic_ids: [])
  end
end
