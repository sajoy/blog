require 'rails_helper'

describe 'the user\'s page' do
  it 'will navigate to a user\'s page' do
    user = FactoryGirl.create(:user)
    login(user)
    click_on 'Revisit your thoughts'
    expect(page).to have_content 'Posts'
  end


end
