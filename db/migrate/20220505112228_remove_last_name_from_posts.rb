class RemoveLastNameFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :last_name, :string
  end
end
