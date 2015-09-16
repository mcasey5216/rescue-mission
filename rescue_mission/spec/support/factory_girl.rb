require 'factory_girl'

FactoryGirl.define do

  factory :question do
    sequence(:title) { |n| "question #{n}" }
    description "This is a dumb question, but how do I make the testing string long enough for me to stop typing nonsense over and over and over over and over and over over and over and over over and over and over over and over and over"
  end

end
