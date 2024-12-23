class AddBloggerReferenceToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :blogger, null: false, foreign_key: true
  end
end
