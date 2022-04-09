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
      expect(@post.errors.full_messages).to include('User must exist')
    end

    it 'タイトルが空では投稿できない' do
      @post.title = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Title can't be blank")
    end

    it '作品名が空では投稿できない' do
      @post.product = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Product can't be blank")
    end

    it 'ジャンルが--では投稿できない' do
      @post.genre_id = '1'
      @post.valid?
      expect(@post.errors.full_messages).to include('Genre must be other than 1')
    end

    it 'タイプが--では投稿できない' do
      @post.type_id = '1'
      @post.valid?
      expect(@post.errors.full_messages).to include('Type must be other than 1')
    end

    it 'ネタバレが--では投稿できない' do
      @post.spoil_id = '1'
      @post.valid?
      expect(@post.errors.full_messages).to include('Spoil must be other than 1')
    end

    it '本文が空では投稿できない' do
      @post.content = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Content can't be blank")
    end

    it 'タイトルが50文字以上では投稿できない' do
      @post.title = 'a' * 51
      @post.valid?
      expect(@post.errors.full_messages).to include('Title is too long (maximum is 50 characters)')
    end

  end
end
