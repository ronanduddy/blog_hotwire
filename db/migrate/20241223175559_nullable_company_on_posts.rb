class NullableCompanyOnPosts < ActiveRecord::Migration[8.0]
  def change
    change_column_null :posts, :company_id, true
  end
end
