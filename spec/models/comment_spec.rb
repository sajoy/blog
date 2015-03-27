require 'rails_helper'

describe Comment do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should belong_to :post }
  it { should belong_to :user }
end
