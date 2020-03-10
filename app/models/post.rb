class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }


  def sum_of_carb_calorie
    carb * 4
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
end
