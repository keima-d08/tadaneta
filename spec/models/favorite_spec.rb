require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    
    @favorite = FactoryBot.create(:favorite)
  end

  describe 'いいね機能' do

    context 'いいねできる場合' do
      it "user_idとpost_idがあれば保存できる" do
        expect(@favorite).to be_valid
      end
    end

    context 'いいねできない場合' do
      it "user_idが空ではいいねできない" do
        @favorite.user_id = ""
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include ("User must exist")
      end

      it "post_idが空ではいいねできない" do
        @favorite.post_id = ""
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include ("Post must exist")
      end
    end

    context "一意性の検証" do
      before do
        @another_favorite = FactoryBot.create(:favorite)
      end
     

      it "post_idとuser_idの組み合わせは一意でなければ保存できない" do
        @favorite = FactoryBot.create(:favorite)
        favorite2 = FactoryBot.build(:favorite, user_id: @favorite.user_id, post_id: @favorite.post_id)
        favorite2.valid?
        expect(favorite2.errors.full_messages).to include("Post has already been taken")
      end

      it "post_idが同じでもuser_idが違えばいいねできる" do
        expect(FactoryBot.create(:favorite, user_id: @another_favorite.user_id)).to be_valid
      end

      it "user_idが同じでもpost_idが違えばいいねできる" do
        expect(FactoryBot.create(:favorite, post_id: @another_favorite.post_id)).to be_valid
      end

    end
  
  end
end
