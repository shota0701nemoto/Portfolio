class Gym < ApplicationRecord
  belongs_to :user #controllerにも紐づいていることを記述
  has_many :comments, dependent: :destroy #controllerにも紐づいていることを記述
  has_many :pictures, dependent: :destroy
  mount_uploaders :picture, PictureUploader
  serialize :picture, JSON
  validates :user_id, presence: true
  validates :content, presence: true
  validates :name, presence: true
  validates :picture, presence: true
end
