class RemoveFirstNameFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :first_name, :string
  end
end
