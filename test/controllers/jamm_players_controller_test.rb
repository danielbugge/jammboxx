require 'test_helper'

class JammPlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jamm_players_index_url
    assert_response :success
  end

  test "should get show" do
    get jamm_players_show_url
    assert_response :success
  end

  test "should get new" do
    get jamm_players_new_url
    assert_response :success
  end

  test "should get create" do
    get jamm_players_create_url
    assert_response :success
  end

  test "should get update" do
    get jamm_players_update_url
    assert_response :success
  end

  test "should get edit" do
    get jamm_players_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get jamm_players_destroy_url
    assert_response :success
  end

end
