# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :dreampost
  counter_culture :dreampost
  validates :user_id, presence: true
  validates :dreampost_id, presence: true
end