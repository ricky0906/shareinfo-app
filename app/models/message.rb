class Message < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
  validates :room_id, numericality: { only_integer: true }
  def was_attached?
    image.attached?
  end
end
