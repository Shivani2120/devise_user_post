class Post < ApplicationRecord
	belongs_to :user
    has_many :post_attachments
    accepts_nested_attributes_for :post_attachments
    has_many :post_likes, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    has_many :follows, dependent: :destroy
end
