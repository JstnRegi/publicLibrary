class SessionsController < ApplicationController

	def new
		@user = User.new
		# binding.pry
	end

end
