class Post < ApplicationRecord
	belongs_to :user
    has_many :post_attachments
    accepts_nested_attributes_for :post_attachments, :allow_destroy => true
    has_many :post_likes, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    has_many :follows, dependent: :destroy
    validates :title, presence: true


    def like_by_users
        User.joins(:post_likes).where(post_likes: {post_id: id}).pluck(:name).to_sentence
    end

    def a_method_to_call
        "add text"
    end
    
    def my_title
        "title"
    end
    
    def my_body
        "body"
    end
end
