require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  def setup
    @user = FactoryGirl.create(:user)
  end

  test "title can be searched" do
    FactoryGirl.create(:article, title: "Article 1 - interesting", author: @user)
    FactoryGirl.create(:article, title: "Article 2", author: @user)

    titles = Article.search_with_index("interesting").map { |a| a.title }

    assert_equal(["Article 1 - interesting"], titles)
  end

  test "body can be searched" do
    FactoryGirl.create(:article, title: "Article 1", body: "interesting", author: @user)
    FactoryGirl.create(:article, title: "Article 2", body: "boring", author: @user)

    titles = Article.search_with_index("interesting").map { |a| a.title }

    assert_equal(["Article 1"], titles)
  end
end

