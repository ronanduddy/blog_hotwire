class TurboFramePostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = current_blogger.company.turbo_frame_posts
  end

  def show
  end

  def new
    @post = TurboFramePost.new
  end

  def edit
  end

  def create
    @post = current_blogger.company.turbo_frame_posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to turbo_frame_posts_path, notice: "Turbo frame post was successfully created." }
        format.turbo_stream do
          flash.now[:notice] = "Turbo frame post was successfully created."

          render turbo_stream: [
            # can remove the above as the model is broadcasting changes
            # otherwise as the creator of a post, we get two prepends rather than the one.
            # turbo_stream.prepend("turbo_posts", partial: "row", locals: { post: @post }),
            turbo_stream.update(TurboFramePost.new, ""),
            turbo_stream.prepend("flash", partial: "/flash")
          ]
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to turbo_frame_post_path(@post), notice: "Turbo frame post was successfully updated." }
        format.turbo_stream do
          flash.now[:notice] = "Turbo frame post was successfully updated."

          render turbo_stream: [
            turbo_stream.replace(
              @post,
              partial: "turbo_frame_posts/post",
              locals: { post: @post }
            ),
            turbo_stream.prepend("flash", partial: "/flash")
          ]
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to turbo_frame_posts_path, status: :see_other, notice: "Turbo frame post was successfully destroyed." }
      format.turbo_stream do
        flash.now[:notice] = "Turbo frame post was successfully destroyed."
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_blogger.company.turbo_frame_posts.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(turbo_frame_post: [ :title, :body ])
            .merge(
              blogger_id: current_blogger.id
            )
    end
end
