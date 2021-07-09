class Post < ApplicationRecord
    validates :title, {presence: true, length: {maximum: 40}}
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}

    belongs_to :user
    belongs_to :event

    mount_uploader :image_post, ImageUploader
end
