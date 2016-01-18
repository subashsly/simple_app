class SessionsController < ApplicationController
  def new
  end



 def create
 	user = User.find_by(email: params[:session][:email].downcase)
 	if user && user.authenticate(params[:session][:password])
 		 log_in user #session[:user_id] = @user.id
 		
 		 redirect_back_or user

 	# Log the user in and redirect to the user's show page.
 	else
 		flash.now[:danger] = 'Invalid email/password combination'
 		render 'new'
 	end
 end

 

#   def create
#   @user = User.find_by_email(params[:session][:email].downcase)
#   if @user && @user.authenticate(params[:session][:password])
#     session[:user_id] = @user.id
#     redirect_to new_post_path
#   else
#     redirect_to '/login', notice: "Password/Login Failed"
#   end 
# end
 def destroy
 	log_out if logged_in?
	redirect_to root_url
 end

end
