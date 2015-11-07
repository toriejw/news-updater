require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  def valid_attributes
    { title: "This is a Title",
      content: "This is some content.",
      image_url: "http://www.atlanticbusinessmagazine.net/wp-content/uploads/2015/02/WhistleBlower.jpg&imgrefurl=http://www.atlanticbusinessmagazine.net/the-whistleblower/&h=250&w=622&tbnid=sU1ambutcN4hpM:&docid=72m3J0FH8T_pNM&ei=7MA3VrD9MInWjwPAj7-4BA&tbm=isch&ved=0CCUQMygGMAZqFQoTCLCjtdzD8sgCFQnrYwodwMcPRw" }
  end

  test "news is valid with correct attributes" do
    news = News.new(valid_attributes)

    assert news.valid?
  end

  test "news is valid with no image url" do
    news = News.new( { title: "title", content: "content" })

    assert news.valid?
  end

  test "news is invalid with no content" do
    news = News.new( { title: "title", content: nil, image_url: "somestring" } )

    refute news.valid?
  end

  test "news is invalid with no title" do
    news = News.new( { title: nil, content: "some content", image_url: "somestring" } )

    refute news.valid?
  end

  test "news content is formatted to be only 100 characters followed by '...'" do
    news = News.new( { title: "Long Content", content: content_of_length_101 } )

    formatted_content = news.formatted_content
    expected = content_of_length_101[0..99] + '...'

    assert_equal expected, formatted_content
  end
end
