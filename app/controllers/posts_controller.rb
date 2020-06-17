class PostsController < ApplicationController
    def index
        posts = Post.all 
        render json: posts.to_json(:include => {
        :comments => {:only => [:content, :user_id, :id]}
        }, except: [:created_at, :updated_at]) 
    end
    
    def new
       Post.new 
    end
    
    def create
       post = Post.create(user_params)
       render json: post.to_json  
    end
    
    def edit
        post = Post.find(params[:id])
    end
    
    def update
        post = Post.find(params[:id])
        post.update(params)
        render json: post.to_json  
    end
    
    def show
        post = Post.find(params[:id])
        render json: post.to_json(:include => {
            :comments => {:only => [:content, :user_id, :id]}
            }, except: [:created_at, :updated_at])
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: { message: 'Post deleted'}
    end

    private 

    def user_params 
        params.require(:post).permit(:caption, :user_id, :img_url)
    end 
end
