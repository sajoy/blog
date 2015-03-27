class Comment < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true
  belongs_to :post
  belongs_to :user

end
