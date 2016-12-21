class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "success"
            redirect_to user_path(user)
        else
            flash[:danger] = "there was something wrong in your login information"
            render 'new'
        end
    end
    
    def destroy
    session[:user_id] = nil
    redirect_to root_path
    end
 

end