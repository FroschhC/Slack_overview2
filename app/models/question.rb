class Question < ApplicationRecord
  validates :title, length: {minimum: 5}
  validates :body, length: {minimum: 20}
  validates :user_id, presence: true

  belongs_to :user
  has_many :answers
end
