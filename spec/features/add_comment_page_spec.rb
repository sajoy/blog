require 'rails_helper'

describe "the new comment process", js: true do
  it "will not load the new_comment path" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    expect(current_path).== post_path(post)
  end

  it "creates a new comment" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    fill_in 'Content', :with => 'You should think about food, cause food is yummy.'
    click_on 'Comment'
    within('div.comments') do
      expect(page).to have_content 'You should think about'
    end
  end

  it "will not post if the content is empty" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    click_on 'Comment'
    expect(page).to have_content 'blank'
  end

  it "will update the number of comments" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    fill_in 'Content', :with => 'You should think about food, cause food is yummy.'
    click_on 'Comment'
    within('div.comments') do
      expect(page).to have_content post.comments.length
    end
  end
end
