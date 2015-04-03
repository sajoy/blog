require 'rails_helper'

describe User do
  it {should have_many :posts}
  it {should have_many :comments}
  it {should validate_presence_of :name}
  it {should validate_length_of(:phone).is_equal_to(10)}
  it { should validate_numericality_of(:phone) }
end
