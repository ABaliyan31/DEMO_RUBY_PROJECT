class Micropost < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one_attached :content
  validates :content, attached: true, size: { less_than: 4.megabytes , message: 'is too large' }, content_type: ['image/png', 'image/jpeg']

end
