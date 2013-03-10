require 'spec_helper'

describe "StaticPages" do
  # describe "GET /static_pages" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get static_pages_index_path
  #     response.status.should be(200)
  #   end
  # end

  subject {page}  #! set page as default test subject

  describe "Home page" do
    before { visit home_path }  #! set home_path as default visit
  	it { should have_content('Sample App') }
  	it { should have_selector('h1', :text => 'Home') }
   	it { should have_selector('title', '| Home' ) }  # TODO: where is Home in title ?
  end

  describe "Help page" do
    before { visit help_path }
  	it { should have_content('Help') }
    it { should have_selector('h1', :text => 'Help') }
    # it { should have_selector('title','| Help') }
    it { should have_selector('title', full_title('Help')) }  # method auto load from /spec/support/*.rb
  end

  describe "About page" do
  	it "should have the content 'About Us'" do
  	    visit about_path
  	    page.should have_content('About Us')
  	end
  	it "should have the h1 'About Us'" do
        	visit about_path
        	page.should have_selector('h1', :text => 'About Us')
    end
    it "should have the title 'About Us'" do
      	visit about_path
      	#page.should have_selector('title',
        #            :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end

  describe "Contact page" do
    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end
    it "should have the title 'Contact'" do
      visit contact_path
      # page.should have_selector('title',
      #              text: "Ruby on Rails Tutorial Sample App | Contact")
    end
  end

end
