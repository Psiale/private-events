class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    if @event.guests.count.positive?
      invited = @event.guests.pluck(:guest_id)
      invited.push(@event.host_id)
      @uninvited_users = User.where.not(id: invited).load
    else
      @uninvited_users = User.where.not(id: @event.host_id)
    end
  end

  def new
    if session[:user_id].nil?
      redirect_to sessions_new_path, flash: { error: 'Insufficient rights!' }
    else
      @event = Event.new
    end
  end

  def create
    return if session[:user_id].nil?

    @user = User.find_by_id(session[:user_id])
    @event = @user.hosted_events.build(time: event_params[:time], location: event_params[:location]) # build
    respond_to do |format|
      if @event.save
        format.html { redirect_to user_path(session[:user_id]), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        flash.now[:notice] = 'Could not create event.'
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:time, :location)
  end
end
