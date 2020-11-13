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
    validates :price, format: { with: /^[0-9]+$/, message: 'Full-width characters' } 
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :region_id
    validates :ship_date_id
  end

end 
