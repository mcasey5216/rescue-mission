require 'factory_girl'

FactoryGirl.define do

  factory :question do
    sequence(:title) { |n| "question #{n}" }
    description "This is a dumb question, but..."
  end

end
