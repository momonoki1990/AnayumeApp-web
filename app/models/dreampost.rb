# frozen_string_literal: true

class Dreampost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true
  validate :picture_size

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  def like?(user)
    like_users.include?(user)
  end

private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:pictre, "ファイルのサイズは5MB以下にしてください。")
    end
  end
end