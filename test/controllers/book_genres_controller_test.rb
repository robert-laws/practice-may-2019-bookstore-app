require 'test_helper'

class BookGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_genres_index_url
    assert_response :success
  end

  test "should get show" do
    get book_genres_show_url
    assert_response :success
  end

  test "should get new" do
    get book_genres_new_url
    assert_response :success
  end

  test "should get edit" do
    get book_genres_edit_url
    assert_response :success
  end

  test "should get delete" do
    get book_genres_delete_url
    assert_response :success
  end

end
