require 'test_helper'

class CategoryTest < ActiveSupport::TestCase 

    def setup 
        @category = Category.new(name: "Sports") 
    end 

    test "category should be valid" do 
        assert @category.valid?
    end  


    test "the name should be present" do
        #created new instance variable beceause tests were firing a database locked error
         @category2 = Category.new(name: " ") 
        assert_not @category2.valid?
    end 

    test "name should be unique" do 
        @category.save
        @category2 = Category.new(name: "Sports")
        assert_not @category2.valid?
    end  

    test "name should not be too long" do 
        @category.name = "This category is way too long"
        # = "a" * 26
        assert_not @category.valid?
    end
    
    test "name should not be too short" do 
        @category3 = Category.new(name: "aa")
        # = "a" * 2
        assert_not @category3.valid?
    end 

end 