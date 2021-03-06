require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Home Page" do
  before do
    visit root_path
    page.should have_css('.find_form > form > input#q')
  end

  it "given an address it should the show legislators in the area" do
    fill_in 'q', :with => '3306 French Place, Austin, TX 78722'
    click_button 'Find'

    page.should have_content("District 25")
    page.should have_content("District 14")

    page.should have_content("Kirk Watson")
    page.should have_content("Kay Bailey Hutchison")
    page.should have_content("John Cornyn")
    page.should have_content("Lloyd A. Doggett")
  end

  it "should redirect to home page when somebody clicks on logo" do
    click_link "OpenGovernment"
    current_path.should == root_path
  end
end
