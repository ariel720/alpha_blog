require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    test "get new category form and create" do
        get new_category_path
        assert_template 'categories/new'
       
        assert_template 'Category.count', 1 do
            post_via_redirect categories_path, category: {name: "sports"}
        end
        
        assert_template 'categories/index'
        assert_match "sport", response.body
    end
end