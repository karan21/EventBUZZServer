class UserInterestsController < ApplicationController
	
	before_action :interest_params, only: [:create,:index]
	respond_to :json
	# /GET user_interest
	def index
		email = params[:email]
		user = User.find_by_email(email)
		@interests = user.interests
		respond_to do |format|
			format.json {render json: @interests, :status => 201}
		end
	end

	#/POST user_interest/create
	def create
		email = params[:email]
		interests = params[:interests]
		user = User.find_by_email(email)
		@interests = user.interests
		@interests.destroy_all
		interests.each do |interest|
			interest_obj = Interest.find_by_interest(interest)
			user_interest = UserInterest.new
			user_interest.user_id = user.id
			user_interest.interest_id = interest_obj.id
			user_interest.save
 		end
		@response = { 'status' => 'ok'}
		respond_to do |format|
			format.json { render json: @response, :status=>201 }
		end
	end

	def interest_params
		params.permit(:email, :interests)
	end
end
