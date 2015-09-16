require 'rails_helper'

feature 'visitor creates question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem

} do
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "answer provided must be at least 50 characters long" do
    question1 = FactoryGirl.create(:question)

    visit "/questions/#{question1.id}"

    fill_in "Description", with: "I am about to show you what at least 50 characters look like for this test"

    click_button "Click here to Submit an Answer"

    expect(page).to have_content("Answer added")
  end

  scenario "answer provided is less than 50 characters long" do
    question1 = FactoryGirl.create(:question)

    visit "/questions/#{question1.id}"

    fill_in "Description", with: "This is not 50 characters"

    click_button "Click here to Submit an Answer"

    expect(page).to have_content("Answer not long enough")
  end

  scenario "answer provided is blank" do
    question1 = FactoryGirl.create(:question)

    visit "/questions/#{question1.id}"

    click_button "Click here to Submit an Answer"

    expect(page).to have_content("Answer not long enough")
  end
end
