require 'test_helper'

class UserSeesNewsTest < ActionDispatch::IntegrationTest
  def create_news_item
    News.create(title: "Title 1", content: content_of_length_101)
  end

  test "user sees news events" do
    news_item = create_news_item
    visit news_index_path

    assert_equal news_index_path, current_path

    within(".news") do
      assert has_content?(news_item.title)
      assert has_content?(news_item.content[0...100])
    end
  end

  test "only 100 characters of each news event are displayed" do
    news_item = create_news_item
    visit news_index_path

    within(".news") do
      assert has_content?(news_item.content[0...100])
      refute has_content?(news_item.content[100])
    end
  end

  test "user can navigate to see individual news items from index page" do
    news_item = create_news_item
    visit news_index_path

    first('.item').click_link('Read more')

    assert_equal news_path(news_item), current_path
    assert page.has_content?(content_of_length_101)
    assert page.has_content?(news_item.title)
  end

  test "user can navigate back to index page from individual news page" do
    news_item = create_news_item
    visit news_path(news_item)

    assert page.has_content?('See all news')

    click_link 'See all news'

    assert_equal news_index_path, current_path
  end

  test "user sees news images" do
    skip
  end

  test "user sees items from newest to oldest" do
    skip
  end
end
