require "application_system_test_case"

class SubCategoryTypesTest < ApplicationSystemTestCase
  setup do
    @sub_category_type = sub_category_types(:one)
  end

  test "visiting the index" do
    visit sub_category_types_url
    assert_selector "h1", text: "Sub Category Types"
  end

  test "creating a Sub category type" do
    visit sub_category_types_url
    click_on "New Sub Category Type"

    fill_in "Image", with: @sub_category_type.image
    fill_in "Name", with: @sub_category_type.name
    fill_in "Sub category", with: @sub_category_type.sub_category_id
    click_on "Create Sub category type"

    assert_text "Sub category type was successfully created"
    click_on "Back"
  end

  test "updating a Sub category type" do
    visit sub_category_types_url
    click_on "Edit", match: :first

    fill_in "Image", with: @sub_category_type.image
    fill_in "Name", with: @sub_category_type.name
    fill_in "Sub category", with: @sub_category_type.sub_category_id
    click_on "Update Sub category type"

    assert_text "Sub category type was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub category type" do
    visit sub_category_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub category type was successfully destroyed"
  end
end
