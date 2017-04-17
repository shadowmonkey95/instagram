class Image < ApplicationRecord
    mount_uploader :file, ImageUploader
    belongs_to :user
    acts_as_votable
end
