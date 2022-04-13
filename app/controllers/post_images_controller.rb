class PostImagesController < ApplicationController
    
    def new
        @post_image = PostImage.new
    end
    
    # 投稿データの保存
    def create
        post_image = PostImage.find(params[:post_image_id])
        comment = current_user.post_comments.new(post_comment_params)
        comment.post_image_id = post_image.id
        comment.save
        redirect_to post_image_path(post_image)
    end
    
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end
    
    def index
        @post_images = PostImage.page(params[:page])
    end
    
    def show
        @post_image = PostImage.find(params[:id])
        @post_comment = PostComment.new
    end
    
    def destroy
        @post_image = PostImage.find(params[:id])
        @post_image.destroy
        redirect_to action: :index
    end
    
    # 投稿データのストロングパラメータ
    private
    
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
    
      def post_comment_params
        params.require(:post_comment).permit(:comment)
      end
end
