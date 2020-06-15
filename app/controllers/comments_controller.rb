class CommentsController < ApplicationController
    def index 
        comments = Comment.all 
        render json: comments.to_json(:include => {
            :replies => {:only => [:content, :user_id, :id]}
        },except: [:created_at, :updated_at ])
    end 

    def new 
        Comment.new 
    end 
    def create 
        Comment.create(comment_params)
    end 

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end 
end
