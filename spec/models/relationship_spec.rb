require 'spec_helper'

describe Relationship do
  pending "add some examples to (or delete) #{__FILE__}"


  let (:follower) {FactoryGirl.create(:user) }
  let (:followed) {FactoryGirl.create(:user) }
  let (:relationship) { follower.relationships.build(followed_id:followed.id)} # user.id is not accessible (why this ...)

  subject { relationship }
  # it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to follower id" do
      # expect do
      #   Relationship.new(follower_id: follower.id) 
      # end.to raise_error( ActiveModel::MassAssignmentSecurity::Error )
    end
  end
end

