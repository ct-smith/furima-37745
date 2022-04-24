require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'nameとexplanation、category_idとpayer_id、prefecture_id、condition_id、delivery_time_id、price、imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品画像を1枚つけることが必須であること。' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること。' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること。' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が必須であること。' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須であること。' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が必須であること。' do
        @item.payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer can't be blank")
      end
      it '発送元の地域の情報が必須であること。' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が必須であること。' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it '価格の情報が必須であること。' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥299以下の場合は保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格が￥10,000,000以上の場合は保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格は半角数値のみ保存可能であること。' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
