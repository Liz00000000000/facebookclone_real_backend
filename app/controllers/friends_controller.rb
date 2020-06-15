class FriendsController < ApplicationController
    def index 
        freinds = Friend.all 
        render json: freinds.to_json
    end 
    def new 
        Friend.new 
    end 
    def create 
        Friend.create(comment_params)
    end 

    def destroy
        friend = Friend.find(params[:id])
        friend.destroy
    end

    private 

    def comment_params
        params.require(:friend).permit(:user_id_2, :user_id_1)
    end 
end
