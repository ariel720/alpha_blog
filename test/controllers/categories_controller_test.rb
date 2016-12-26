require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    #show에는 반드시 id가 필요하기때문에 만들어줌.
    def setup 
        @category = Category.create(name: "sports")
    end
    

test "should get index" do
    get :index
    assert_response :success

end

test "should get new" do
     get :new
    assert_response :success

end

test "should get show" do
     get(:show, {'id' => @category.id})
    assert_response :success

end



end