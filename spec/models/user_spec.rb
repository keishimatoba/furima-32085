require 'rails_helper'
RSpec.describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'ユーザーの登録記載要素が全て揃えば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること ' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに＠を含まなければ登録できないこと' do
        @user.email = 'kkkemail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_nameが空では登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角数字のみでは登録できないこと' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      
      it 'passwordが全角英語では登録できないこと' do
        @user.password = 'ａ00000'
        @user.password_confirmation = 'ａ00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationは値が同じでないと登録出来ないこと' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00001'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'family_nameが全角でないと登録できないこと' do
        @user.family_name = 'abc'
        @user.valid?
        expect(@user.errors[:family_name]).to include('Family name Full-width katakana characters')
      end

      it 'first_nameが全角でないと登録できないこと' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors[:first_name]).to include('First name Full-width katakana characters')
      end

      it 'family_name_kanaが全角カタカナでないと登録できないこと' do
        @user.family_name_kana = 'あいう'
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include('Family name kana Full-width katakana characters')
      end

      it 'first_name_kanaが全角カタカナでないと登録できないこと' do
        @user.first_name_kana = 'かきく'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('First name kana Full-width katakana characters')
      end
    end
  end
end
