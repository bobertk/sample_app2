require 'spec_helper'

describe "StaticPages" do
	
	subject { page }
  
	describe "Home page" do		
		before { visit root_path}
		
		it { should have_selector('h1', text: 'Sample App') }			
		it { should have_selector('title',
                        :text => "Ruby on Rails Tutorial Sample App") }        
    it { should_not have_selector('title', :text => '| Home') }    
	end
	
	describe "Help page" do		
		
		it "should have the the h1 'Help' " do
			visit help_path
			page.should have_selector('h1', :text => 'Help')
		end
		
		it "should have the base title" do
      visit help_path
      page.should have_selector('title',
                        :text => "Ruby on Rails Tutorial Sample App")
    end
    
    it "should not have a custom page title" do
      visit help_path
      page.should_not have_selector('title', :text => '| Help')
    end
	end
	
	describe "About page" do		
		
		it "should have the content 'About Us' " do
			visit about_path
			page.should have_selector('h1', :text => 'About Us')
		end
		
		it "should have the base title" do
      visit about_path
      page.should have_selector('title',
                        :text => "Ruby on Rails Tutorial Sample App")
    end
    
    it "should not have a custom page title" do
      visit about_path
      page.should_not have_selector('title', :text => '| About Us')
    end
	end
	
	describe "Contact page" do		
		
		it "should have the h1 'Contact' " do
			visit contact_path
			page.should have_selector('h1', :text => 'Contact')
		end
		
		it "should have the base title" do
      visit contact_path
      page.should have_selector('title',
                        :text => "Ruby on Rails Tutorial Sample App")
    end
    
    it "should not have a custom page title" do
      visit contact_path
      page.should_not have_selector('title', :text => '| Contact')
    end
	end
end
