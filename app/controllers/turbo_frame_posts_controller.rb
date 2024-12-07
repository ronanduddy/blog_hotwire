class TurboFramePostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = TurboFramePost.all
  end

  def show
  end

  def new
    @post = TurboFramePost.new
  end

  def edit
  end

  def create
    @post = TurboFramePost.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to turbo_frame_posts_path, notice: "Turbo frame post was successfully created." }
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend("turbo_posts", partial: "row", locals: { post: @post }),
            turbo_stream.update(TurboFramePost.new, "")
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
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to turbo_frame_posts_path, status: :see_other, notice: "Turbo frame post was successfully destroyed." }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(helpers.dom_id(@post, "row")) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = TurboFramePost.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(turbo_frame_post: [ :title, :body ])
    end
end
