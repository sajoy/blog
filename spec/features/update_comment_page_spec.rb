require 'rails_helper'

describe "the edit post process" do
  it "updates a comment" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    comment = Comment.create({
      name: "Jane",
      content: "LOL.",
      post_id: post.id})
    visit posts_path
    click_on post.title
    click_on 'edit'
    fill_in 'Content', :with => 'LMAO!!!'
    click_on 'Comment'
    expect(page).to have_content 'revision'
  end

  it "will not update if name is empty" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    comment = Comment.create({
      name: "Jane",
      content: "LOL.",
      post_id: post.id})
    visit posts_path
    click_on post.title
    click_on 'edit'
    fill_in 'Name', :with => ''
    click_on 'Comment'
    expect(page).to have_content 'blank'
  end

  it "will not update if content is empty" do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    comment = Comment.create({
      name: "Jane",
      content: "LOL.",
      post_id: post.id})
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
      name: "Jane",
      content: "LOL.",
      post_id: post.id})
    visit posts_path
    click_on post.title
    click_on 'edit'
    click_on 'or just toss it in the virtual trash can'
    expect(page).to have_no_content comment.content
  end


end
