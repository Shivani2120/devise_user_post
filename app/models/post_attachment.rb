class PostAttachment < ApplicationRecord
	belongs_to :post
	mount_uploader :avatar, AvatarUploader
end
