require 'rails_helper'

feature 'visitor views questions', %Q{
  As a visitor
  I want to view all the questions asked so far
  So that I know whether to ask a new question
} do
  # Acceptance Criteria
  #
  # * I can navigate to a question listing for a given category
  # * On the category listing, I should only see questions that fall within that
  #   category
  # * For nonexistant categories, a question listing should not exist
  #
  let(:question) { FactoryGirl.create(:question) }

  scenario 'Display all questions on index page' do
    question1 = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question)
    question3 = FactoryGirl.create(:question)

    visit '/questions/'
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question2.title)
    expect(page).to have_content(question3.title)

    expect(page).to_not have_content(question1.description)
    expect(page).to_not have_content(question2.description)
    expect(page).to_not have_content(question3.description)


  end

  scenario 'click on a question to see the details of it' do
    question1 = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question)
    question3 = FactoryGirl.create(:question)

    visit '/questions/'
    click_link "#{question1.title}"
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.description)
  end

  scenario 'return to the main page once done viewing a questions details' do
    question1 = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question)
    question3 = FactoryGirl.create(:question)

    visit "/questions/#{question1.id}"
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.description)
    click_link "All questions"
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question2.title)
    expect(page).to have_content(question3.title)

    expect(page).to_not have_content(question1.description)
    expect(page).to_not have_content(question2.description)
    expect(page).to_not have_content(question3.description)

  end
end
