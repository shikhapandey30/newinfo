require 'test_helper'

class SubCategoryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_category_type = sub_category_types(:one)
  end

  test "should get index" do
    get sub_category_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_category_type_url
    assert_response :success
  end

  test "should create sub_category_type" do
    assert_difference('SubCategoryType.count') do
      post sub_category_types_url, params: { sub_category_type: { image: @sub_category_type.image, name: @sub_category_type.name, sub_category_id: @sub_category_type.sub_category_id } }
    end

    assert_redirected_to sub_category_type_url(SubCategoryType.last)
  end

  test "should show sub_category_type" do
    get sub_category_type_url(@sub_category_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_category_type_url(@sub_category_type)
    assert_response :success
  end

  test "should update sub_category_type" do
    patch sub_category_type_url(@sub_category_type), params: { sub_category_type: { image: @sub_category_type.image, name: @sub_category_type.name, sub_category_id: @sub_category_type.sub_category_id } }
    assert_redirected_to sub_category_type_url(@sub_category_type)
  end

  test "should destroy sub_category_type" do
    assert_difference('SubCategoryType.count', -1) do
      delete sub_category_type_url(@sub_category_type)
    end

    assert_redirected_to sub_category_types_url
  end
end
