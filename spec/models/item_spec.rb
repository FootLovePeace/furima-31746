require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
   @item = FactoryBot.build(:item)
 end

 describe '商品出品機能' do
   context '商品出品がうまくいくとき' do
     it '全ての項目の入力が存在すれば出品できる' do
      expect(@item).to be_valid
    end
   end   

   context '商品出品がうまくいかないとき' do 
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end 

    it 'nameが空だと出品できない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空だと出品できない' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryが空だと出品できない' do
      @item.category= nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end  

    it 'categoryのid選択が1だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end  

    it 'statusが空だと出品できない' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end  

    it 'statusのid選択が1だと出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end  

    it 'postageが空だと出品できない' do
      @item.postage = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage Select")
    end  

    it 'postageのid選択が1だと出品できない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage Select")
    end  

    it 'regionが空だと出品できない' do
      @item.region = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region Select")
    end  

    it 'regionのid選択が1だと出品できない' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Region Select")
    end  

    it 'ship_dateが空だと出品できない' do
      @item.ship_date = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship date Select")
    end  

    it 'ship_dateのid選択が1だと出品できない' do
      @item.ship_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship date Select")
    end  

    it 'priceが空だと出品できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end    

    it 'priceが299以下だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end  

    it 'priceが10000000だと出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end  

    it 'priceが半角数字入力でないと出品できない' do
      @item.price = "９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end 

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")  
    end      
   end
 end
end