class ItemPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :city, :block, :building, :phone_number, :purchase_record_id

  
  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'Input only number'} 
    # validates :token
  end

  validates :region_id, numericality: { other_than: 1, message: 'Select' } 

  def save
  purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
  Address.create(postcode: postcode, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end

