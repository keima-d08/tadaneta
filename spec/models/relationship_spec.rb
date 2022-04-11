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
        @another_user = FactoryBot.build(:relationship)
      end

      it "follower_idとfollowed_idの組み合わせは一意でなければ保存できない" do
        @another_relation = FactoryBot.build(:relationship, follower_id: @relationship.follower_id, followed_id: @relationship.followed_id)
        @another_relation.valid?
        expect(@another_relation.errors.full_messages).to include("Follower has already been taken")
      end

      it "follower_idが同じでもfollowed_idが違うなら保存できる" do
        @another_relation = FactoryBot.build(:relationship, follower_id: @relationship.follower_id, followed_id: @another_user.followed_id)
        expect(@another_relation).to be_valid
      end

      it "follower_idが違うならfollowed_idが同じでも保存できる" do
        @another_relation = FactoryBot.build(:relationship, follower_id: @another_user.follower_id, followed_id: @relationship.followed_id)
        expect(@another_relation).to be_valid
      end
    end
  end
end