class TasksController < ApplicationController
  before_action :set_room

  def index
    @tasks = @room.tasks.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def create
    @task = @room.tasks.new(task_params)
    if @task.save
      redirect_to room_path(@room), notice: 'タスクを作成しました'
    else
      @tasks = @room.tasks.all
      redirect_to room_path(@room), notice: 'title content dayを入力してください'
    end
  end

  def show
    @task = @room.tasks.find(params[:id])
  end

  def destroy
    @task = @room.tasks.find(params[:id])
    @task.destroy
    redirect_to room_path(@room), notice: '削除しました'
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :start_time)
  end
end
