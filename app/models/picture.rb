# frozen_string_literal: true

class Picture < ApplicationRecord
  mount_uploaders :picture, PictureUploader
  belongs_to :gym, dependent: :destroy
end
