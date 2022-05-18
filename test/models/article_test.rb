require "test_helper"

class ArticleTest < ActiveSupport::TestCase
    test 'cannot save article without a title or description ' do 
      article = Article.new 
      assert_not article.save, "Saved article without title or description"
    end 
end
