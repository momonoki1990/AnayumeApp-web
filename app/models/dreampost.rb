# frozen_string_literal: true

class Dreampost < ApplicationRecord
  attr_accessor :search
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

  class << self
    def search(search)
      return Dreampost.all unless search
      
      Dreampost.where(['content LIKE ?', "%#{search}%"])
    end
  end

  private

  def picture_size
    errors.add(:pictre, "ファイルのサイズは5MB以下にしてください。") if picture.size > 5.megabytes
  end
end
