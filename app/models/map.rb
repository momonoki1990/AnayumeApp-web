class Map < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
  validate :picture_size

  geocoded_by :address
  before_validation :geocode

  private

  def picture_size
    errors.add(:pictre, "ファイルのサイズは5MB以下にしてください。") if picture.size > 5.megabytes
  end
end
