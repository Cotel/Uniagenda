class EventsController < ApplicationController
    before_filter :is_logged

  def index
      @events = Event.where(:events => {user_id: current_user.id})
  end

  def new
  end

  def show
      @event = Event.find(params[:id])
      if not @event.user_id == current_user.id
          redirect_to root_path
      end
  end

  def create
      @event = Event.new(event_params)
      @event.user_id = current_user.id
      @event.completed = false
      @event.save
      redirect_to @event
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to events_path
  end

  private
    def event_params
        params.require(:event).permit(
            :title,
            :description,
            :user_id,
            :place,
            :start_date,
            :end_date,
            :completed)
    end
end
