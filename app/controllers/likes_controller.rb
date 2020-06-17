class LikesController < ApplicationController
    def index 
        likes = Like.all 
        render json: likes.to_json
    end 
    def new 
        Like.new 
    end 
    def create 
        like = Like.create(like_params)
        render json: like.to_json
    end 

    private 

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end 
end
