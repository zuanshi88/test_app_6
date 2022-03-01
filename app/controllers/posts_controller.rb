class PostsController < ApplicationController 

    def index 
    end 

    def show 
        # byebug
        @post = Post.find(params[:id])
    end 
end 