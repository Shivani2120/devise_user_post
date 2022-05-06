class RemoveContactFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :contact, :string
  end
end
