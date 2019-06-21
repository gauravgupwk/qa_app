class Question < ApplicationRecord
  validates :question, presence: true
  belongs_to :user
  belongs_to :topic

  has_many :questions
  has_many :answers
end
