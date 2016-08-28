class SessionsController < ApplicationController
    
    def new
    end
    def create
        user= User.find_by(email: params[:session][:email].downcase)
        session[:user_id] = user.id
        if user && user.authenticate(params[:session][:password])
           flash[:success] = "Succesfully Logged in"
           redirect_to users_path(user)
        else
             flash[:danger] = "The Combo of Password and Email is wrong"
            render 'new'
        end
        
    end
    def destroy
        session[:user_id] = nil
        flash[:success] = "Succesfully Logged out"
        redirect_to articles_path
    end
    
    
end