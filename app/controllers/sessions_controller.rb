class SessionsController < ApplicationController

	def new
		@user = User.new
		# binding.pry
	end

	def create
		user_params = params.require(:user).permit(:email, :password)
		@user = User.confirm(user_params)
		if @user
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			redirect_to '/sign_in'
		end
	end

	def destroy
		@user = User.find_by_id([params[:id]])
		logout(@user) # <-- sets users session.id to nill
		redirect_to sign_in_path # <-- redirects to sign in page
	end

end
