class AddAuthorToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :author_id, :integer
  end
end
