class Company < ApplicationRecord
  has_many :bloggers, dependent: :destroy
  has_many :turbo_frame_posts, inverse_of: :company, dependent: :destroy

  validates :name, presence: true
end
