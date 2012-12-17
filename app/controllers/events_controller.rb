class EventsController < ApplicationController
  before_filter :authenticate
  def index
    if current_user
      @events = current_user.events
    else
      @events = Event.all
    end
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
    elsif current_admin
      @user = current_admin
    else
      redirect_to new_user_session_path
    end
  end

end
