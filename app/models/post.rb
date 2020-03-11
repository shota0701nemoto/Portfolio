class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  def sum_of_carb_calorie
    posts.sum(:carb)
  end

  def sum_of_protein_calorie
    protein * 4
  end

  def sum_of_fat_calorie
    fat * 9
  end

  def sum_of_of_total_calorie
    carb_calorie + protein_calorie + fat_calorie
  end
  
  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
  
end
