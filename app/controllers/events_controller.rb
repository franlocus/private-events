class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_path, notice: 'Event created successfully'
    else
      render :new, alert: 'Error, the event was not created'       
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_date, :location)
  end
end
