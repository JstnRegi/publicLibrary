class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, presence: true;
	validates :email, uniqueness: true;

	has_secure_password

	def self.confirm(params)
		@user = User.find_by_email(params[:email])
		@user.authenticate(params[:password])
	end
end
