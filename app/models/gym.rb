class Gym < ApplicationRecord
  belongs_to :user #controllerにも紐づいていることを記述
  has_many :comments, dependent: :destroy #controllerにも紐づいていることを記述
  validates :user_id, presence: true
  validates :content, presence: true
  validates :name, presence: true
  
  

  
end
