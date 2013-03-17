require 'spec_helper'
describe User do
    # pending "add some example to (or delete) #{__FILE__}"
    before { @user = User.new(name: "Example User",email: "user@example.com", 
        password: "foobar", password_confirmation: "foobar" )}
    subject { @user }
    it { should respond_to(:name) }  # user.respond_to?(:name) 
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }

    it {should be_valid}

    describe "when name is not present" do
        before { @user.name = "" } 
        it { should_not be_valid }
    end

    describe "when name is too long" do
        before { @user.name = "a"*51 }
        it { should_not be_valid }
    end

    describe "when email format is invalid" do
        it "should be invalid" do
        	addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
        	addresses.each do |invalid_address|
        	   @user.email = invalid_address
        	   @user.should_not be_valid
        	end
        end
    end
    describe "when email format is valid" do
        it "should be invalid" do
        	addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        	addresses.each do |valid_address|
        	   @user.email = valid_address
        	   @user.should be_valid
        	end
        end
    end
    describe "when email address is already taken" do
        before do 
        	# user_with_same_email = @user.dup
        	user_with_same_email = @user.clone
        	user_with_same_email.email = @user.email.upcase
        	user_with_same_email.save
        end
        it { should_not be_valid}
    end

    describe "microposts associations" do
        before { @user.save }
        let!(:order_micropost) do
            FactoryGirl.create(:micropost, user: @user,created_at: 1.day.ago)
        end
        let!(:newer_micropost) do
            FactoryGirl.create(:micropost, user: @user,created_at: 1.hour.ago)
        end

         describe "status" do
            let(:unfollowed_post) do
                FactoryGirl.create(:micropost,user: FactoryGirl.create(:user))
            end
            its (:feed) { should include(newer_micropost) }
            its (:feed) { should include(order_micropost) }
            its (:feed) { should_not include(unfollowed_post) }
        end
     end  

end
