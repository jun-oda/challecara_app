class PostsController < ApplicationController
    def index
      @search_keyword = search_params[:keyword]
  
      @posts =
        if @search_keyword.nil?
          Post.all.order(created_at: :desc)
        else
          Post.where(['comment LIKE ?', "%#{@search_keyword}%"]).order(created_at: :desc)
        end
    end
  
    def create
      @post = Post.new(post_params)
      @post.save
  
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("post", partial: "posts/dummy")
        end 
      end
    end
  
    private
    def search_params
      params.permit(:keyword)
    end
  
    def post_params
      params.require(:post).permit(:name,:comment)
    end
  end