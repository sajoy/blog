require 'rails_helper'

describe "the post viewing process" do
  it 'will go to an individual post page' do
    post = Post.create({
      title: 'Things to Ponder',
      content: 'Rivers, why uncomfortable couches exist,
      the color of dying plants, how insects communicate,
      cultural diffusion, [to be continued]'})
    visit posts_path
    click_on post.title
    expect(page).to have_content post.content
  end
  
end
