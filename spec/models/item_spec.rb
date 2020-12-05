require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '出品情報の保存' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it '写真がないと保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '説明文が空だと保存できないこと' do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end
    it '価格が空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '商品の状態を選択していないと保存できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 0')
    end
    it '配送料の負担を選択していないと保存できないこと' do
      @item.postage_payer_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage payer must be other than 0')
    end
    it '発送元の地域を選択していないと保存できないこと' do
      @item.prefecture_code_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture code must be other than 0')
    end
    it '発送までの日数を選択していないと保存できないこと' do
      @item.preparetion_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Preparetion day must be other than 0')
    end
    it 'カテゴリーを選択していないと保存できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end
    it '価格が全角数字だと保存できないこと' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '価格が300円未満では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格が9,999,999円を超過すると保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
