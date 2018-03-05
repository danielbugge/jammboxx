require 'test_helper'

class InstrumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instruments_index_url
    assert_response :success
  end

  test "should get show" do
    get instruments_show_url
    assert_response :success
  end

  test "should get new" do
    get instruments_new_url
    assert_response :success
  end

  test "should get create" do
    get instruments_create_url
    assert_response :success
  end

  test "should get update" do
    get instruments_update_url
    assert_response :success
  end

  test "should get edit" do
    get instruments_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get instruments_destroy_url
    assert_response :success
  end

end
