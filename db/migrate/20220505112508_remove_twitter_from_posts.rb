class RemoveTwitterFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :twitter, :string
  end
end
