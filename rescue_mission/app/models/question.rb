class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 150}
end
