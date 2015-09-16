require 'rails_helper'

feature 'user edits a question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates

} do

  # Acceptance Criteria
  #
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page

  scenario 'if forms are empty' do
      question1 = FactoryGirl.create(:question)
      visit "/questions/#{question1.id}/edit"

      fill_in("Title", with: nil)
      click_button "Click here to Update"
      expect(page).to have_content("can't be blank")
  end

  scenario 'if description is less than 150 characters' do
    question1 = FactoryGirl.create(:question)
    visit "/questions/#{question1.id}/edit"

    fill_in("Title", with: "I have a question.")
    fill_in("Description", with: "Not long enough" )

    click_button "Click here to Update"
    expect(page).to have_content("Description is too short")

  end

  scenario 'must be a link in details page for edit page' do
    question1 = FactoryGirl.create(:question)
    visit "questions/#{question1.id}"

    click_link "Edit Question"

    expect(page).to have_content("Update this Question")

  end

end
