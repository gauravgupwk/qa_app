class Topic < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :users
  has_many :questions
end
