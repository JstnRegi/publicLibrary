class UsersController < ApplicationController
	before_action :logged_in?, only: :show

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		userParams = params.require(:user).permit(:first_name, :last_name, :email, :password)
		@user = User.create(userParams)
		login(@user) # <-- logs in the user
		redirect_to "/users/#{@user.id}" # <-- goes to show page of that user 
	end

	def show
		# unless logged_in?
		# 	flash[:error] = "You must be logged in to access this section"
		# 	redirect_to sign_in_path
		# end
		@user = User.find(params[:id])
	end

	
end
