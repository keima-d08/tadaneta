require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録出来る時'
    it '必要なユーザー情報が全て存在すれば登録できる' do
      expect(@user).to be_valid
    end

    context '新規登録出来ない時'
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'プロフィールが空では登録できない' do
      @user.profile = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("プロフィールを入力してください")
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it '既に登録されているemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordは6文字以上でないと登録できない' do
      @user.password = 'aaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください', 'パスワードは不正な値です')
    end

    it 'passwordは128文字以下でないと登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
    end

    it 'passwordは半角英字を含んでいないと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it 'passwordは半角数字を含んでいないと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it 'passwordは半角英数字を含んでいないと登録できない' do
      @user.password = '１１１ａｂｃ'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end

    it 'nicknameが20文字以上では登録できない' do
      @user.nickname = 'a' * 21
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームは20文字以内で入力してください")
    end

    it 'プロフィールが200以上では登録できない' do
      @user.profile = 'a' * 201
      @user.valid?
      expect(@user.errors.full_messages).to include("プロフィールは200文字以内で入力してください")
    end

  end
end