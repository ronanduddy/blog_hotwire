require "test_helper"

class TurboFramePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turbo_frame_post = turbo_frame_posts(:one)
  end

  test "should get index" do
    get turbo_frame_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_turbo_frame_post_url
    assert_response :success
  end

  test "should create turbo_frame_post" do
    assert_difference("TurboFramePost.count") do
      post turbo_frame_posts_url, params: { turbo_frame_post: {} }
    end

    assert_redirected_to turbo_frame_post_url(TurboFramePost.last)
  end

  test "should show turbo_frame_post" do
    get turbo_frame_post_url(@turbo_frame_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_turbo_frame_post_url(@turbo_frame_post)
    assert_response :success
  end

  test "should update turbo_frame_post" do
    patch turbo_frame_post_url(@turbo_frame_post), params: { turbo_frame_post: {} }
    assert_redirected_to turbo_frame_post_url(@turbo_frame_post)
  end

  test "should destroy turbo_frame_post" do
    assert_difference("TurboFramePost.count", -1) do
      delete turbo_frame_post_url(@turbo_frame_post)
    end

    assert_redirected_to turbo_frame_posts_url
  end
end
