require 'rails_helper'

feature 'user views a question', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question

} do
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario 'i want to get to show page from index page' do
    question1 = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question)

    visit '/questions/'
    click_link "#{question1.title}"
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.description)
  end
end
