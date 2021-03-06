class EventsController < ApplicationController
  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    @invitation = Invitation.new
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, notice: 'Event edited successfully'
    else
      render :edit, alert: 'Error, the event was not edited'       
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, notice: 'Event deleted successfully'
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_date, :location)
  end
end
