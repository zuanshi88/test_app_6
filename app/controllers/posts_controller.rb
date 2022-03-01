class PostsController < ApplicationController 
    def show 
        byebug
        @post = Post.find(params[:id])
    end 
end 