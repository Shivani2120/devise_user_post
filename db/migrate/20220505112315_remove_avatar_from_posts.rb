class RemoveAvatarFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :avatar, :string
  end
end
