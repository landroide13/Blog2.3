require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create username:'landrade', email:'landrade13@icloud.com', password:'131313'
  end

  test "get new category form and create new category" do 
    sign_in_as(@user, '131313')
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: 'sports'}}  
      follow_redirect!    
    end
    assert_template 'categories/index'
    assert_match 'sports', response.body
  end

  test "invalid category submision results in failure" do
    sign_in_as(@user, '131313')
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: ''}}  
      #follow_redirect!    
    end
    assert_template 'categories/new'
    assert_select 'div.col-sm-8'
    #assert_select 'div.panel-body'
  end

  




end