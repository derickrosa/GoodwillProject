class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @timelines = Timeline.all
    respond_with(@timelines)
  end

  def show
    respond_with(@timeline)
  end

  def new
    @timeline = Timeline.new
    respond_with(@timeline)
  end

  def edit
  end

  def create
    @timeline = Timeline.new(timeline_params)
    @timeline.save
    respond_with(@timeline)
  end

  def update
    @timeline.update(timeline_params)
    respond_with(@timeline)
  end

  def destroy
    @timeline.destroy
    respond_with(@timeline)
  end

  private
    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    def timeline_params
      params.require(:timeline).permit(:user_id, :request_id)
    end
end
