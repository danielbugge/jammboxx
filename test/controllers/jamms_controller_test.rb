require 'test_helper'

class JammsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jamms_index_url
    assert_response :success
  end

  test "should get show" do
    get jamms_show_url
    assert_response :success
  end

  test "should get new" do
    get jamms_new_url
    assert_response :success
  end

  test "should get create" do
    get jamms_create_url
    assert_response :success
  end

  test "should get update" do
    get jamms_update_url
    assert_response :success
  end

  test "should get edit" do
    get jamms_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get jamms_destroy_url
    assert_response :success
  end

end
