class RepliesController < ApplicationController
    def index 
        replies = Reply.all 
        render json: replies.to_json
    end 
     
    def new 
        Reply.new 
    end 
    def create 
       reply = Reply.create(reply_params)
       render json: reply.to_json
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
