require 'rails_helper'

feature 'user views all questions', %Q{
  As a user
I want to view recently posted questions
So that I can help others


} do

  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  let(:question) { FactoryGirl.create(:question) }

  scenario 'Home page has title of each question' do
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

  scenario 'questions must be listed in order of most recently first' do
    question1 = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question)

    visit '/questions/'
    expect(question1.created_at).to be < question2.created_at
    expect(page.text.index(question2.title)).to be < page.body.index(question1.title)
  end
end
