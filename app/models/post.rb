class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :title, :content, presence: true
  scope :recent, ->{order("created_at DESC")}
end
