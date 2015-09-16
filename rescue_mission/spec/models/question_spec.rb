require 'rails_helper'

RSpec.describe Question, type: :model do

  it { should have_valid(:title).when("I don't know computers", 'Complicated rspec question') }
  it { should_not have_valid(:title).when(nil) }

  it { should have_valid(:description).when("This is a dumb question, but how do I make the testing string long enough for me to stop typing nonsense over and over and over over and over and over over and over and over over and over and over", "This is a dumb question, but how do I make the testing string long enough for me to stop typing nonsense over and over and over over and over and over over and over and over over and over and overover and over and over") }
  it { should_not have_valid(:description).when(nil) }

end
