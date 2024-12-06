require "application_system_test_case"

class TurboFramePostsTest < ApplicationSystemTestCase
  setup do
    @turbo_frame_post = turbo_frame_posts(:one)
  end

  test "visiting the index" do
    visit turbo_frame_posts_url
    assert_selector "h1", text: "Turbo frame posts"
  end

  test "should create turbo frame post" do
    visit turbo_frame_posts_url
    click_on "New turbo frame post"

    click_on "Create Turbo frame post"

    assert_text "Turbo frame post was successfully created"
    click_on "Back"
  end

  test "should update Turbo frame post" do
    visit turbo_frame_post_url(@turbo_frame_post)
    click_on "Edit this turbo frame post", match: :first

    click_on "Update Turbo frame post"

    assert_text "Turbo frame post was successfully updated"
    click_on "Back"
  end

  test "should destroy Turbo frame post" do
    visit turbo_frame_post_url(@turbo_frame_post)
    click_on "Destroy this turbo frame post", match: :first

    assert_text "Turbo frame post was successfully destroyed"
  end
end
