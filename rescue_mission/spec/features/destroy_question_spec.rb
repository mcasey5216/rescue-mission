require 'rails_helper'

feature 'user deletes question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions

} do

  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted

  scenario 'delete question from edit page' do
    question1 = FactoryGirl.create(:question)
    visit "questions/#{question1.id}/edit"

    click_link "Delete Question"

    # expect(page).to_not have_content("#{question1.title}")
    expect(page).to have_content("Question Deleted")
  end

  scenario 'delete question from details page' do
    question1 = FactoryGirl.create(:question)
    visit "questions/#{question1.id}/"

    click_link "Delete Question"

    # expect(page).to_not have_content(question1.title)
    expect(page).to have_content("Question Deleted")
  end
end
