class SessionsController < ApplicationController
 def new
  end

  def create
    user=User.find_by(email:params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id]=user.id
      flash[:notice]="Logged in successfully"
      redirect_to about_path
    else
      #flash.now[:login_errors]=["Invalid credentials"]
      render :new
      
    end
  end
  def destroy
     session[:user_id] = nil
     flash[:notice] = "You have been logged out."
     redirect_to root_path
  end
  #private
  #def login_params
   # params.require(:user).permit(:email,:password)
  #end
end
