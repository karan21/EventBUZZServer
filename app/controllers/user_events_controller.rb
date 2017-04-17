class UserEventsController < ApplicationController

	# POST /user_events.json
	def create
		email = params[:email]
		eventId = params[:eventId]
		status = params[:status]
		user = User.find_by_email(email)
		event = Event.find(eventId)
		userEvent = UserEvent.where("user_id = ? AND event_id = ?",user.id, eventId)
		if userEvent.present?
			userEvent = userEvent.first
		else
			userEvent = UserEvent.new	
			userEvent.user_id = user.id
			userEvent.event_id = event.id
		end
		userEvent.status = status
		userEvent.save
		@response = { 'status' => 'ok'}
		respond_to do |format|
			format.json { render json: @response, :status=>201 }
		end	
	end

	#PATCH /user_events.json
	def update
		id = params[:userEventId]
		status = params[:status]
		userEvent = UserEvent.find(id)
		userEvent.status = status
		userEvent.save
		@response = { 'status' => 'ok'}
		respond_to do |format|
			format.json { render json: @response, :status=>201 }
		end	
	end

	#POST /user_events/index.json
	def index
		email = params[:email]
		user = User.find_by_email(email)
		events = user.events
		respond_to do |format|
			format.json { render json: events, :status=>201 }
		end
	end

	#POST /user_events/get_status.json
	def get_status
		eventId = params[:eventId]
		email = params[:email]
		user = User.find_by_email(email)
		userEvent = UserEvent.where("user_id = ? AND event_id = ?",user.id, eventId)
		response = Hash.new
		if userEvent.present?
			response["status"] = userEvent.first.status
		else
			response["status"] = "NO"
		end
		puts "**************************"
		puts response["status"]
		puts "**************************"
		respond_to do |format|
			format.json { render json: response.as_json, :status=>201 }
		end	
	end

	def user_event_params
		params.permit(:email, :eventId)
	end
end
