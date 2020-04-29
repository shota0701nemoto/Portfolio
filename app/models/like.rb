class Like < ApplicationRecord
    belongs_to :user
    belongs_to :gym
    validates_uniqueness_of :gym_id, scope: :user_id
end
