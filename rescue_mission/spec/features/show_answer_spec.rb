require 'rails_helper'

feature 'user views the answer on a questions page', %Q{
  As a user
  I want to view the answers for a question
  So that I can learn from the answer
} do

  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last
  scenario 'I must see only the answers to the question I am viewing' do
    question1 = FactoryGirl.create(:question)
    answer = Answer.create(question_id: question1.id, description: "I am about to show you what at least 50 characters look like for this test")
    visit "/questions/#{question1.id}"

    expect(page).to have_content("I am about to show you what at least 50 characters look like for this test")


  end

  scenario 'I must see the answers in order of most recent' do
    question1 = FactoryGirl.create(:question)
    answer1 = Answer.create(question_id: question1.id, description: "I am about to show you what at least 50 characters look like for this test")
    answer2 = Answer.create(question_id: question1.id, description: "I am about to show you what at least 50 characters look like for this test")

    visit "/questions/#{question1.id}"

    expect(answer1.created_at).to be < answer2.created_at
    expect(page.text.index(answer2.description)).to be < page.body.index(answer1.description)
  end


end
