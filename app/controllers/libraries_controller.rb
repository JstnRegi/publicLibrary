class LibrariesController < ApplicationController

	def index
		@libraries = Library.all
		current_user
	end

	def new
		@library = Library.new
	end

	def create
		libraryParams = params.require(:library).permit(:name, :floor_count, :floor_area)
		@library = Library.create(libraryParams)

		redirect_to '/libraries'
	end

end
