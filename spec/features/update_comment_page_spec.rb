require 'rails_helper'

describe "the edit post process" do

  it "will not load the new_comment path", js: true do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    comment = Comment.create({
      content: "LOL.",
      post_id: post.id,
      user_id: user.id})
    visit post_path(post)
    click_on 'edit'
    expect(current_path).== post_path(post)
  end

  it "updates a comment" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    comment = Comment.create({
      content: "LOL.",
      post_id: post.id,
      user_id: user.id})
    visit posts_path
    click_on post.title
    click_on 'edit'
    fill_in 'Content', :with => 'LMAO!!!'
    click_on 'Comment'
    within('div.comments') do
      expect(page).to have_content 'LMAO!!!'
    end
  end

  it "will not update if content is empty" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    comment = Comment.create({
      content: "LOL.",
      post_id: post.id,
      user_id: user.id})
    visit posts_path
    click_on post.title
    click_on 'edit'
    fill_in 'Content', :with => ''
    click_on 'Comment'
    expect(page).to have_content 'blank'
  end

  it "will delete the comment" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    comment = Comment.create({
      content: "LOL.",
      post_id: post.id,
      user_id: user.id})
    visit posts_path
    click_on post.title
    click_on 'delete'
    expect(page).to have_no_content comment.content
  end


end
