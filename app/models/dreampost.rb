# frozen_string_literal: true

class Dreampost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true
  validate :picture_size

private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:pictre, "ファイルのサイズは5MB以下にしてください。")
    end
  end
end