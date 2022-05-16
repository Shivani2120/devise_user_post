class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy   
  mount_uploader :image, ImageUploader 
  has_many :post_likes, dependent: :destroy 
  has_many :post_comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :contact, length: { minimum: 10 }
  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
