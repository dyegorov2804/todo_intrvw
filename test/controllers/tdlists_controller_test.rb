require 'test_helper'

class TdlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tdlist = tdlists(:one)
  end

  test "should get index" do
    get tdlists_url
    assert_response :success
  end

  test "should get new" do
    get new_tdlist_url
    assert_response :success
  end

  test "should create tdlist" do
    assert_difference('Tdlist.count') do
      post tdlists_url, params: { tdlist: { completed: @tdlist.completed, description: @tdlist.description } }
    end

    assert_redirected_to tdlist_url(Tdlist.last)
  end

  test "should show tdlist" do
    get tdlist_url(@tdlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_tdlist_url(@tdlist)
    assert_response :success
  end

  test "should update tdlist" do
    patch tdlist_url(@tdlist), params: { tdlist: { completed: @tdlist.completed, description: @tdlist.description } }
    assert_redirected_to tdlist_url(@tdlist)
  end

  test "should destroy tdlist" do
    assert_difference('Tdlist.count', -1) do
      delete tdlist_url(@tdlist)
    end

    assert_redirected_to tdlists_url
  end
end
