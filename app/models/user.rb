class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  validates :name, presence: true
  validates :phone, length: {is: 10}, allow_blank: true
  validates_numericality_of :phone, allow_blank: true
end
