class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :blogger
  belongs_to :company, optional: true

  validates :title, :body, presence: true
end
