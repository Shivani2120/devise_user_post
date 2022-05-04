class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.string :email
      t.string :twitter

      t.timestamps
    end
  end
end
