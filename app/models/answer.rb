class Answer < ApplicationRecord
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :body, length: {minimum: 20}

  belongs_to :user
  belongs_to :question
end
