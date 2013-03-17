require 'spec_helper'

describe "Micropost pages " do

    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }
    describe " micropost destruction" do
        before { FactoryGirl.create(:micropost,user:user) }

        describe "as current user" do
            before { visit root_path }
            it "should delete a micropost" do
                expect { click_link "delete" }.to change(Micropost,:count).by(-1)
            end
        end
    end        

end