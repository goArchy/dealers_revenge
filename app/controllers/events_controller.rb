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

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "Event updated"
      redirect_to events_path
    else
      flash[:alert] = "There was an error updating your event."
      render 'edit'
    end
  end


  def destroy
     @event = Event.find(params[:id]).destroy
     flash[:success] = "Event destroyed."
     redirect_to events_path
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
