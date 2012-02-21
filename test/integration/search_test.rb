require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:article, title: "Article 1 - interesting", author: @user)
    FactoryGirl.create(:article, title: "Article 2 - meh", author: @user)
  end

  test "articles can be searched" do
    visit articles_path

    within("#search-nav") do
      fill_in "query", :with => "interesting"
      click_button "submit" 
    end

    assert_content("Article 1")
    assert_no_content("Article 2")
  end
end

