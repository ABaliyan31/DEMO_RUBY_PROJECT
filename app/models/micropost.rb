class Micropost < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one_attached :content

end
