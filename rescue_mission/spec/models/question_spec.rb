require 'rails_helper'

RSpec.describe Question, type: :model do

  it { should have_valid(:title).when("I don't know computers", 'Complicated rspec question') }
  it { should_not have_valid(:title).when(nil) }

  it { should have_valid(:description).when("Help I am dog", "I don't understand what Stuff*Category::Whatever means") }
  it { should_not have_valid(:description).when(nil) }

end
