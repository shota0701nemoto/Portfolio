class Picture < ApplicationRecord
    mount_uploaders :picture, PictureUploader
     belongs_to :gym, dependent: :destroy
end
