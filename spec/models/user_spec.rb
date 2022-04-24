require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nick_nameとemail、passwordとpassword_confirmation、first_name_kanji、last_name_kanji、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが必須であること。' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'メールアドレスが必須であること。' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること。' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること。' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'wwww1'
        @user.password_confirmation = 'wwww1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = 'aaaAAA@'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password = 'wwwww1'
        @user.password_confirmation = 'wwwww2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは、英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'パスワードは、数字のみのパスワードでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'お名前(全角)は、名前が必須であること。' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'お名前(全角)は、名字が必須であること。' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.first_name_kanji = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid. Input full-width characters')
      end
      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.last_name_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji is invalid. Input full-width characters')
      end
      it 'お名前カナ(全角)は、名前が必須であること。' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名字が必須であること。' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名前が全角（カタカナ）での入力が必須であること。' do
        @user.first_name_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'お名前カナ(全角)は、名字が全角（カタカナ）での入力が必須であること。' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it '生年月日が必須であること。' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
