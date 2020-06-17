class UsersController < ApplicationController
    def index
        users = User.all 
        render json: users.to_json
    end
    
    def new
       User.new 
    end
    
    def create
       user = User.create(user_params)
       render json: user.to_json  
    end
    
    def edit
        user = User.find(params[:id])
    end
    
    def update
        user = User.find(params[:id])
        user.update(params)
        render json: user.to_json  
    end
    
    def show
        user = User.find(params[:id])
        render json: user.to_json(:include => {
            :posts => {:only => [:caption, :img_url, :user_id, :id]}
            }, except: [:created_at, :updated_at])
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { message: 'User deleted'}
    end

    private 

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :age, :occupation, :location, :college, :picture, :email, :password, :bio)
    end 
end
