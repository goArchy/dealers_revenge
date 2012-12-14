class EventsController < ApplicationController
  before_filter :authenticate
  def index
    @events = Event.all
    @events = Event.paginate(page: params[:page])
  end

  def new
    @event = Event.new
  end

  def create
    @event = @user.events.new(params[:event])
    if @event.save
      flash[:success] = "Event Created!"
      redirect_to events_path
    else
      render 'new'
    end
  end


  def destroy
     @event.destroy
     redirect_to root_url
  end

  private
  def authenticate
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end

end
