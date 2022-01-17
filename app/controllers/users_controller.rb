class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
    end

    def destroy
        @user = current_user
        @user.destroy
        redirect_to :controller => "items", :action => "top"
    end
end
