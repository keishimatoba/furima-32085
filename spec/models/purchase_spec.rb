require 'rails_helper'
RSpec.describe Purchase, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase).to be_valid
    end
    it '建物名が空でも保存できること' do
      @purchase.building_name = nil
      expect(@purchase).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @purchase.post_code = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号の半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase.post_code = '1234567'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '都道府県を選択していないと保存できないこと' do
      @purchase.prefecture_code_id = 0
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture code must be other than 0")
    end
    it '市区町村が空だと保存できないこと' do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @purchase.house_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @purchase.phone_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が12桁を超えると保存できないこと' do
      @purchase.phone_number = '090000099998'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号にハイフンを含むと保存できないこと' do
      @purchase.phone_number = '090-0000999'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が英数混合では保存できないこと' do
      @purchase.phone_number = '0900000999a'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end