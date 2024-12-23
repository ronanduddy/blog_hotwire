class AddCompanyReferenceToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :company, null: false, foreign_key: true
  end
end
