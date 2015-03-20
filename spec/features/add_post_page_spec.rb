require 'rails_helper'

describe "the new post process" do
  it "creates a new post" do
    visit posts_path
    click_on 'Express yourself'
    fill_in 'Title', :with => 'Things to Ponder'
    fill_in 'Content',
      :with => 'Rivers, why uncomfortable couches exist,
      the color of dying plants, how insects communicate,
      cultural diffusion, [to be continued...]'
    click_on 'Publish'
    expect(page).to have_content 'awesome'
  end

  it "will not publish if no title is given" do
    visit posts_path
    click_on 'Express yourself'
    fill_in 'Content', :with => 'Titles are for chumps.'
    click_on 'Publish'
    expect(page). to have_content 'went wrong'
  end
end
