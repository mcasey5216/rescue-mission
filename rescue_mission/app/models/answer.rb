class Answer < ActiveRecord::Base
  belongs_to :question

  validates :description, length: { minimum: 50}
  validates :question_id, presence: true
end
