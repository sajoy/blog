require 'rails_helper'

describe "the edit post process" do
  it "updates a new post" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'revise post'
    fill_in 'Title', :with => 'Things to Ponder'
    click_on 'Publish'
    expect(page).to have_content 'revision'
  end

  it "will not accept an empty title" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'revise post'
    fill_in 'Title', :with => ''
    click_on 'Publish'
    expect(page).to have_content 'empty'
  end

  it "will not accept empty content" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'revise post'
    fill_in 'Content', :with => ''
    click_on 'Publish'
    expect(page).to have_content 'empty'
  end

  it "will delete a post" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    click_on 'revise post'
    fill_in 'Content', :with => ''
    click_on 'or just toss it in the virtual trash can'
    expect(page).to have_no_content post.title
  end

end
