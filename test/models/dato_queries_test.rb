require 'test_helper'

class DatoQueriesTest < ActiveSupport::TestCase
  include DatoQueries

  def test_homepage_query
    client = Dato::Client.new
    response = client.execute(homepage_query)
    assert_not_empty response.data.allPosts
  end

  def test_blog_post_query
    client = Dato::Client.new
    response = client.execute(blog_post_query('mistakes-tourists-make-on-their-first-trip-abroad'))
    assert_not_empty response.data.post.title
  end
end