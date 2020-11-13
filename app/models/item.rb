class Item < ApplicationRecord
  beloｎgs_to :user
  has_one_attached :image
end
