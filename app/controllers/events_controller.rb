class EventsController < ApplicationController
    
    def index
        @events = Event.order(time: :asc) 
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.create(event_params)
        if @event.save
            redirect_to @event
        else
            flash.now[:notice] = "Failed to create event"
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
        @user = User.find_by(id: @event.user_id)
    end

    def attending
        @event = Event.find(params[:id])
        type = params[:type]
        if type == "attending"
            current_user.attending << @event
            redirect_to event_path, notice: "You are now attending this event"
        elsif type == "not-attending"
            current_user.attending.delete(@event)
            redirect_to event_path, notice: "You are no longer attending this event"
        end
    end

    private
    
    def event_params
        params.require(:event).permit(:title, :description, :location, :time)
    end

end
