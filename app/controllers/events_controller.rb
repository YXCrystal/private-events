class EventsController < ApplicationController
    def new
        @event = Event.new
    end

    def create
        @event = Event.create(event_params)
        if @event.save
            redirect_to @event
        else
            flash.now[:notice] = "Failed to create event"
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    private
    
    def event_params
        params.require(:event).permit(:title, :description, :location, :time)
    end
end
