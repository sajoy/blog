FactoryGirl.define do

  factory(:user) do
    email('saj@calpo.com')
    password('password')
  end

  factory(:post) do
    title('Things to Pond')
    content('Rivers, why uncomfortable couches exist,
    the color of dying plants, how insects communicate,
    cultural diffusion, [to be continued]')
  end

  factory(:comment) do
    email('saj@calpo.com')
    password('password')
  end



end
