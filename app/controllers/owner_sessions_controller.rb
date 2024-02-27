class OwnerSessionsController < ApplicationController
    def index 
        @bus =Bus.all
    end 

    def new
      # Render the owner login form
    end
  
    def create
      # Authenticate the owner based on provided credentials
      if params[:username] == 'Naincy' && params[:password] == '123456'
        session[:owner_id] = 1  # You may set a session variable to identify the owner
        redirect_to root_path, notice: 'Owner logged in successfully.'
      else
        flash.now[:alert] = 'Invalid username or password.'
        render :new
      end
    end
  
    def destroy
      session[:owner_id] = nil
      redirect_to root_path, notice: 'Owner logged out successfully.'
    end
  end
  