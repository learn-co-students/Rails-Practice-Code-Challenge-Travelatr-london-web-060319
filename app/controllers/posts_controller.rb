class PostsController < ApplicationController
    def index 
        @posts = Post.all 
    end

    def new 
        @post = post.new
    end 

    def show
        @post = Post.find(params[:id])
    end

    def create 
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to @post
        else     
            render :new 
        end 
    end 

    def like 
        @post = Post.find(params[:id])
        @post.likes += 1 
        @post.save
        redirect_to @post


    private

    def post_params
      params.require(:post).permit(:title, :content, :destination_id, :blogger_id
    end
end