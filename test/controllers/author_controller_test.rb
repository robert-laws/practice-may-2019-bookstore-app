require 'test_helper'

class AuthorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get author_index_url
    assert_response :success
  end

  test "should get show" do
    get author_show_url
    assert_response :success
  end

  test "should get new" do
    get author_new_url
    assert_response :success
  end

  test "should get edit" do
    get author_edit_url
    assert_response :success
  end

  test "should get delete" do
    get author_delete_url
    assert_response :success
  end

end
