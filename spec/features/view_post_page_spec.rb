require 'rails_helper'

describe "the post viewing process" do
  it 'will go to an individual post page' do
    user = FactoryGirl.create(:user)
    login(user)
    post = FactoryGirl.create(:post)
    user.posts.push(post)
    visit posts_path
    click_on post.title
    expect(page).to have_content post.content
  end

  it "will show a post's comments " do
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
    expect(page).to have_content comment.content
  end
end
