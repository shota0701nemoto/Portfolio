class Picture < ApplicationRecord
    mount_uploader :picture, ImageUploader
     belongs_to :gym, inverse_of: :pictures
end
