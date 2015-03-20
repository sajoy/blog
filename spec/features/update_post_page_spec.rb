require 'rails_helper'

describe "the edit post process" do
  it "updates a new post" do
    post = Post.create({
      title: 'Things to Pond',
      content: 'Rivers, why uncomfortable couches exist,
      the color of dying plants, how insects communicate,
      cultural diffusion, [to be continued]'})
    visit posts_path
    click_on post.title
    click_on 'revise post'
    fill_in 'Title', :with => 'Things to Ponder'
    click_on 'Publish'
    expect(page).to have_content 'revision'
  end

  it "will not accept an empty title" do
    post = Post.create({
      title: 'Things to Ponder',
      content: 'Rivers, why uncomfortable couches exist,
      the color of dying plants, how insects communicate,
      cultural diffusion, [to be continued]'})
    visit posts_path
    click_on post.title
    click_on 'revise post'
    fill_in 'Title', :with => ''
    click_on 'Publish'
    expect(page).to have_content 'empty'
  end

  it "will not accept empty content" do
    post = Post.create({
      title: 'Things to Ponder',
      content: 'Rivers, why uncomfortable couches exist,
      the color of dying plants, how insects communicate,
      cultural diffusion, [to be continued]'})
    visit posts_path
    click_on post.title
    click_on 'revise post'
    fill_in 'Content', :with => ''
    click_on 'Publish'
    expect(page).to have_content 'empty'
  end

end
