class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :company

  validates :title, :body, presence: true
end
