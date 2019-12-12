require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get books_new_url
    assert_response :success
  end

  test "should get index_unread" do
    get books_index_unread_url
    assert_response :success
  end

  test "should get index_read" do
    get books_index_read_url
    assert_response :success
  end

end
