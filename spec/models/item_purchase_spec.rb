require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '全ての項目の入力が正しく存在すれば購入できる' do
       expect(@item_purchase).to be_valid
      end

      it 'buildingは空でも購入できる' do
       @item_purchase.building = nil
       expect(@item_purchase).to be_valid
      end
    end   

    context '商品購入がうまくいかないとき' do
      it 'postcodeが空だと購入できない' do
        @item_purchase.postcode = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postcode can't be blank")
      end 

      it 'postcodeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @item_purchase.postcode = "1234567"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postcode Input correctly")
      end 

      it 'regionのid選択が1だと購入できない' do
        @item_purchase.region_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Region Select")
      end 

      it 'cityが空だと購入できない' do
        @item_purchase.city = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end 

      it 'blockが空だと購入できない' do
        @item_purchase.block = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Block can't be blank")
      end 

      it 'phone_numberが空だと購入できない' do
        @item_purchase.phone_number = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end 

      it 'phone_numberが数字のみの正しい形式でないと購入できない' do
        @item_purchase.phone_number = "000-000-000"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number Input only number")
      end 

      it 'phone_numberが11以下でないと購入できない' do
        @item_purchase.phone_number = "000000000000"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number Input only number")
      end 

      it "tokenが空では購入できない" do
        @item_purchase.token = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
