class LikesController < ApplicationController
    def index 
        likes = Like.all 
        render json: likes.to_json
    end 
    def new 
        Like.new 
    end 
    def create 
        like = Like.create(comment_params)
        render json: like.to_json
    end 

    private 

    def comment_params
        params.require(:like).permit(:user_id, :post_id)
    end 
end
