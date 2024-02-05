class UsersController < ApplicationController
	include UserConcern

	def signup
		user = User.create(params)
		if user.save!
			render json: { token: token, user: user, message: "User has been created successfully" }
		else
			render json: { error: { message: user.error } }
		end
	end
end
