require 'rails_helper'

feature 'user creates question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others

} do
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario 'user must provide a description at least 150 characters long' do
    visit 'questions/new'

    fill_in("Title", with: "I have a question.")
    fill_in("Description", with: "It's about how to run this test with something that is more than 150 characters so I will keep typing until i believe i have reached the desired testing length." )

    click_button("Add question")

    expect(page).to have_content("Questions")

  end

  scenario 'user puts description less than 150 characters long' do
    visit 'questions/new'

    fill_in("Title", with: "Another one for ya")

    click_button("Add question")
    expect(page).to have_content("Description is too short")
  end

  scenario 'user doesnt fill out one of the forms' do

    visit 'questions/new'

    fill_in("Title", with: "Another one for ya")

    click_button("Add question")
    expect(page).to have_content("can't be blank")
  end

end
