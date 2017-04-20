class ImageCommentsController < ApplicationController
  before_action :set_image_comment, only: [:show, :edit, :update, :destroy]

  # GET /image_comments
  def index
    @image_comments = ImageComment.all
  end

  # GET /image_comments/1
  def show
  end

  # GET /image_comments/new
  def new
    @image_comment = ImageComment.new
  end

  # GET /image_comments/1/edit
  def edit
  end

  # POST /image_comments
  def create
    @image_comment = ImageComment.new(image_comment_params)
    @image_comment.user_id = current_user.id

    if @image_comment.save
      url = "/images/" + @image_comment.image_id.to_s
      redirect_to url, notice: 'Image comment was successfully created.'
      
    else
      render :new
    end
  end

  # PATCH/PUT /image_comments/1
  def update
    if @image_comment.update(image_comment_params)
      redirect_to @image_comment, notice: 'Image comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /image_comments/1
  def destroy
    @image_comment.destroy
    redirect_to image_comments_url, notice: 'Image comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_comment
      @image_comment = ImageComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_comment_params
      params.require(:image_comment).permit(:user_id, :image_id, :comment)
    end
end
