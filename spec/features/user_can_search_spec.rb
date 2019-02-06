require 'rails_helper' 

describe "As a visitor" do
  context "on the homepage" do
    it "can search and be redirected to the search path" do
      visit root_path
      fill_in "q",	with: "80203" 
      click_on "Locate"

      expect(current_path).to eq(search_path) 
      expect(page).to have_content("10 Closest Stations within 6 miles")

      # add test for checking sort with information from api after having hit it
    end
  end
end
