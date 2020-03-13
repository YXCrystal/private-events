class EventsController < ApplicationController
    
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, except: [:index, :show, :homepage]
    
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

    def edit 
    end

    def update
        @event.update(event_params)
        redirect_to event_path, notice: "Event has been updated"
    end 

    def show
        @user = User.find_by(id: @event.user_id)
    end

    def destroy
        @event.destroy 
        redirect_to events_path, notice: "Event has been cancelled"
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
    
    def find_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :location, :time)
    end

end
