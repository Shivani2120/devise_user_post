class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy   
  mount_uploader :image, ImageUploader 
  has_many :post_likes, dependent: :destroy 
  has_many :post_comments, dependent: :destroy
end
