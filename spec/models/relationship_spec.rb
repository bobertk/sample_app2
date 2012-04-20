require 'spec_helper'

describe Relationship do
	# setup a relationship
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) do
    follower.relationships.build(followed_id: followed.id)
  end

  # ok we built a relationship - lets validate it
  subject { relationship }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to follower_id" do
      expect do
        Relationship.new(follower_id: follower.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  # now test belongs_to association
  describe "follower methods" do
    before { relationship.save }

    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should == follower }
    its(:followed) { should == followed }
	end

  
end