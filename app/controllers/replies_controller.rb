class RepliesController < ApplicationController
    def index 
        replies = Reply.all 
        render json: replies.to_json
    end 
     
    def new 
        Reply.new 
    end 
    def create 
        Reply.create(reply_params)
    end 

    def destroy
        reply = Reply.find(params[:id])
        reply.destroy
    end

    private 

    def reply_params
        params.require(:reply).permit(:comment_id, :content)
    end 
end
