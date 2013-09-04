require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_selector('h1', :text => 'Sample App') }
    it { title.should eq("Ruby on Rails Tutorial Sample App | Home") }
  end

  describe "Help page" do
    before { visit help_path }
    it { should have_content('Help') }
    it { title.should eq("Ruby on Rails Tutorial Sample App | Help") }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content('About Us') }
    it { title.should eq("Ruby on Rails Tutorial Sample App | About") }
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_selector('h1', text: 'Contact') }
    it { title.should eq("Ruby on Rails Tutorial Sample App | Contact") }
  end

end