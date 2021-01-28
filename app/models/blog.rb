class Blog < ApplicationRecord
has_many :comments
 validates :name, presence: true, length: { maximum: 20 }
 validates :title, presence: true, length: { maximum: 30 }
 validates :body, presence: true, length: { maximum: 1000 }
 mount_uploader :image, ImageUploader
end
