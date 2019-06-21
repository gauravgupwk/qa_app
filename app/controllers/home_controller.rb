class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @topics = Topic.all

    topic_questions = Question.includes(topic: :users).where(topics: {users: {id: current_user.id}})

    following_questions = Question.where(user_id: current_user.following.pluck(:id))
    @questions = (topic_questions + following_questions).uniq
  end
end
