class Toy < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  mount_uploader :picture, PictureUploader
end
