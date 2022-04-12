require 'rails_helper'

RSpec.describe Comment, type: :model do
    before do
      @comment = FactoryBot.build(:comment)
    end

  describe 'コメント投稿' do

    context 'コメント出来る時'
      it 'コメント内容が存在すれば投稿できる' do
       expect(@comment).to be_valid
    end

    context 'コメント出来ない時'

    it '本文が空ではコメントできない' do
    @comment.content = ""
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Contentを入力してください")
    end

    it 'ユーザー情報がなければコメントできない' do
      @comment.user= nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Userを入力してください")
      end

  end
end
