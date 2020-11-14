class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :region
  belongs_to :ship_date

  with_options presence: true do
    validates :image   
    validates :name
    validates :description
    validates :price, inclusion: {in: 300..9999999 } 
  end

  validates :price, format: { with: /\A[0-9]+\z/ }

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :region_id
    validates :ship_date_id
  end

end 
