class TurboFramePost < Post
  default_scope { order(created_at: :desc) }

  belongs_to :blogger, inverse_of: :turbo_frame_posts
  belongs_to :company, inverse_of: :turbo_frame_posts

  after_create_commit -> {
    broadcast_prepend_later_to( # via a web socket rather than AJAX
      "super_posts", # subscribers listen to this channel/stream
      partial: "turbo_frame_posts/row",
      locals: { post: self },
      target: "turbo_posts" # id/frame
    )
  }

  # the above could be reduced to the following if conventions were followed
  # after_create_commit -> { broadcast_prepend_to "turbo_frame_posts" }

  after_update_commit -> {
    broadcast_update_later_to(
      "super_posts",
      partial: "turbo_frame_posts/row",
      locals: { post: self },
      target: "row_turbo_frame_post_#{id}"
    )
  }

  after_destroy_commit -> {
    broadcast_remove_to(
      "super_posts",
      target: "row_turbo_frame_post_#{id}"
    )
  }

  # the above three broadcasts can be written as the following if conventions were followed:
  # broadcasts_to ->(turbo_frame_post) { "turbo_frame_posts" }, inserts_by: :prepend
end
