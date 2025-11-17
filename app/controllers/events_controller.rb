class EventsController < ApplicationController
  before_action :set_group
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.group = @group

    if @event.save
      GroupMailer.notify_members(@event, @group).deliver_now
      redirect_to group_event_path(@group, @event), notice: '送信が完了しました。'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def sent
    @event = Event.find(params[:id])
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def event_params
    params.require(:event).permit(:title, :content)
  end


end
