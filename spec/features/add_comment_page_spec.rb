require 'rails_helper'

describe "the new comment process" do
  it "creates a new comment" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    fill_in 'Name', :with => 'George'
    fill_in 'Content', :with => 'You should think about food, cause food is yummy.'
    click_on 'Comment'
    expect(page).to have_content 'commenting'
  end

  it "will not post if the name is empty" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    fill_in 'Content', :with => 'You should think about food, cause food is yummy.'
    click_on 'Comment'
    expect(page).to have_content 'blank'
  end

  it "will not post if the content is empty" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    fill_in 'Name', :with => 'Jane'
    click_on 'Comment'
    expect(page).to have_content 'blank'
  end
end
