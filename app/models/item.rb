class Item < ApplicationRecord
  beloｎgs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :region
  belongs_to :ship_date

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end
end 
