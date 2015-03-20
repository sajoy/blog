require 'rails_helper'

describe "the new comment process" do
  it "creates a new comment" do
    post = Post.create({
      title: 'Things to Pond',
      content: 'Rivers, why uncomfortable couches exist,
      the color of dying plants, how insects communicate,
      cultural diffusion, [to be continued]'})
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    fill_in 'Name', :with => 'George'
    fill_in 'Content', :with => 'You should think about food, cause food is yummy.'
    click_on 'Comment'
    expect(page).to have_content 'commenting'
  end

  it "will not post if the name is empty" do
    post = Post.create({
      title: 'Things to Pond',
      content: 'Rivers, why uncomfortable couches exist,
      the color of dying plants, how insects communicate,
      cultural diffusion, [to be continued]'})
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    fill_in 'Content', :with => 'You should think about food, cause food is yummy.'
    click_on 'Comment'
    expect(page).to have_content 'blank'
  end

  it "will not post if the content is empty" do
    post = Post.create({
      title: 'Things to Pond',
      content: 'Rivers, why uncomfortable couches exist,
      the color of dying plants, how insects communicate,
      cultural diffusion, [to be continued]'})
    visit posts_path
    click_on post.title
    click_on 'Leave a comment'
    fill_in 'Name', :with => 'Jane'
    click_on 'Comment'
    expect(page).to have_content 'blank'
  end
end
