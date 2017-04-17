class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /images
  def index
    @images = Image.all
  end

  # GET /images/1
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end
  
   #Like
  def upvote
    @image = Image.find(params[:id])
    @image.upvote_by current_user
    redirect_to :back
  end
  
  #Unlike
  def downvote
    @image = Image.find(params[:id])
    @image.downvote_by current_user
    redirect_to :back
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:user_id, :title, :file, :descript, :created_at)
    end
end
