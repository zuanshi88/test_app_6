require "test_helper"

class NewArticleCreationTest < ActionDispatch::IntegrationTest
    def setup
      @admin_user = User.create(username:"Jim", email: "jim@jim.com", password: "password", admin: true)
      log_in_as(@admin_user)
    end 

    test 'signed in user can create a new article' do 
      get '/articles/new'
      assert_response :success 
      assert_difference 'Article.count', 1 do 
        post articles_path, params: { article: { title: "A Great Read", description: "Something everyone should read" } }
      end 
    end 

    test 'new articles must have titles' do 
      get '/articles/new'
      assert_response :success 
      assert_no_difference 'Article.count' do 
        post articles_path, params: { article: { title: " ", description: "Something everyone should read" } }
      end 
    end 

    test 'unsigned in user cannot create a new article' do 
        delete '/logout'
        get '/articles/new'
        assert_response :redirect 
    end 

end
