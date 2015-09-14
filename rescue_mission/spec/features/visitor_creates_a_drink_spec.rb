# require 'rails_helper'
#
# feature 'visitor creates question', %Q{
#   As a visitor
#   I want to create a question
#   So I can share its deliciousness with others
# } do
#   # Acceptance Criteria:
#   #
#   # * I must specify a unique title of 5 characters or more
#   # * I can optionally specify a description
#   # * If I don't enter a valid title, I should be presented with an error message
#   # * If I successfully add the question, I should see it in the listing of questions
#
#   scenario 'add a valid question' do
#     category = FactoryGirl.create(:category)
#     question_title = 'Pumpkin Martini'
#     visit '/questions/new'
#
#     fill_in 'Title', with: question_title
#     fill_in 'Description', with: 'Likely the best martini you will ever have. A Thanksgiving must.'
#     check 'Featured'
#     select category.name, from: 'Category'
#     choose 'Medium'
#
#     click_button 'Add question'
#
#     expect(page).to have_content('question added.')
#     expect(page).to have_content(question_title)
#   end
#
#   scenario 'attempt to add an invalid question' do
#     visit '/questions/new'
#
#     click_button 'Add question'
#
#     expect(page).to have_content("can't be blank")
#   end
# end
