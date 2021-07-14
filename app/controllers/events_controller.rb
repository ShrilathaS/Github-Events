class EventsController < ApplicationController
  
  # GET /events
  def index
    @events = Event.all
    render json: @events, status: 200
  end
  
  # POST /events
  def create
    @event = Event.new(:event_id => params[:id], :event_type => params[:event_type], :public => params[:public], 
                        :repo_id => params[:repo_id], :actor_id => params[:actor_id])
    if @event.valid?
      @event.save
      render json: @event, status: 201
    else
      render json: { error: @event.errors.full_messages }, status: 400
    end
  end 
  
  # GET /events/:id
  def show
    @event = Event.find_by_event_id(params[:id])
    if !@event.nil?
      render json: @event
    else
      render json: { error: 'Unable to Fetch Event for the given Event ID.' }, status: 404
    end  
  end
  
  # GET /repos/:repo_id/events
  def repo_events
    @events = Event.where("repo_id = ?", params[:repo_id])
    if @events.count > 0
      render json: @events
    else
      render json: { error: 'Unable to Fetch Events for the given Repo ID.' }, status: 404
    end
  end 
  
end
