class Picture < ApplicationRecord
    mount_uploader :picture, ImageUploader
     belongs_to :gym, optional: true
end
