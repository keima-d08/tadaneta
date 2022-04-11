require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @relationship= FactoryBot.create(:relationship)
  end

  describe 'フォロー機能' do
    
    context "フォローできる場合" do
      it "全てのパラメーターが揃っていればフォローできる" do
        expect(@relationship).to be_valid
      end
    end

    context "フォローできない場合" do
      it "follower_idが空の場合は保存できない" do
        @relationship.follower_id = ""
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include("Follower must exist", "Follower can't be blank")
      end

      it "followed_idが空の場合は保存できない" do
        @relationship.followed_id = ""
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include("Followed must exist", "Followed can't be blank")
      end
    end

    context "一意性の検証" do

      before do
        @relation = FactoryBot.create(:relationship)
        @user1 = FactoryBot.build(:relationship)
      end

      it "follower_idとfollowed_idの組み合わせは一意でなければ保存できない" do
        relation2 = FactoryBot.build(:relationship, follower_id: @relation.follower_id, followed_id: @relation.followed_id)
        relation2.valid?
        expect(relation2.errors.full_messages).to include("Follower has already been taken")
      end

      it "follower_idが同じでもfollowed_idが違うなら保存できる" do
        relation2 = FactoryBot.build(:relationship, follower_id: @relation.follower_id, followed_id: @user1.followed_id)
        expect(relation2).to be_valid
      end

      it "follower_idが違うならfollowed_idが同じでも保存できる" do
        relation2 = FactoryBot.build(:relationship, follower_id: @user1.follower_id, followed_id: @relation.followed_id)
        expect(relation2).to be_valid
      end
    end
  end
  
end