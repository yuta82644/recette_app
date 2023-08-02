# app/controllers/tasks_controller.rb

class TasksController < ApplicationController
   before_action :set_room

  def index
    @tasks = @room.tasks.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @task = @room.tasks.new
  end

  def create
    @task = @room.tasks.new(task_params)
    if @task.save
      redirect_to room_path(@room), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :start_time)
  end
end