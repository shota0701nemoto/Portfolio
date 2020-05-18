class Gym < ApplicationRecord
  belongs_to :user #controllerにも紐づいていることを記述
  has_many :comments, dependent: :destroy #controllerにも紐づいていることを記述
  has_many :pictures, dependent: :destroy
  has_many :likes
   has_many :liked_users, through: :likes, source: :user
  mount_uploaders :picture, PictureUploader
  serialize :picture, JSON
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  validates :name, presence: true, length: { maximum: 24 }
  validates :picture, presence: true

end
