require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '新規投稿出来る時'
    it '必要な投稿情報が全て存在すれば投稿できる' do
      expect(@post).to be_valid
    end

    context '新規投稿出来ない時'
    it 'ユーザー情報無しでは投稿できない' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('Userを入力してください')
    end

    it 'タイトルが空では投稿できない' do
      @post.title = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('タイトルを入力してください')
    end

    it '作品名が空では投稿できない' do
      @post.product = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('作品名を入力してください')
    end

    it 'ジャンルが空では投稿できない' do
      @post.genre_id = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('ジャンルを入力してください')
    end

    it 'タイプが空では投稿できない' do
      @post.type_id = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('タイプを入力してください')
    end

    it 'ネタバレ度が空では投稿できない' do
      @post.spoil_id = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('ネタバレ度を入力してください')
    end

    it '本文が空では投稿できない' do
      @post.content = ''
      @post.valid?
      expect(@post.errors.full_messages).to include('本文を入力してください')
    end

    it 'タイトルが50文字以上では投稿できない' do
      @post.title = 'a' * 51
      @post.valid?
      expect(@post.errors.full_messages).to include('タイトルは50文字以内で入力してください')
    end
  end
end
