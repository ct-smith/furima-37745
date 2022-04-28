require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
 describe '商品購入機能' do
   before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
   end

  
    context '商品購入ができる時' do
      it 'postal_code,prefecture_id,city,address_line,phone_numberが存在すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it '郵便番号が必須であること。' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_address.postal_code = 1111111
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が必須であること。' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須であること。' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること。' do
        @purchase_address.address_line = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address line can't be blank")
      end
      it '電話番号が必須であること。' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @purchase_address.phone_number = 11111
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
 end
end