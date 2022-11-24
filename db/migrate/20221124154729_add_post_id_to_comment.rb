class AddPostIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :posts, :integer
    add_index :comments, :posts
  end
end
