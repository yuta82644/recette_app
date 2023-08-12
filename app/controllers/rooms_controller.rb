class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @user_rooms = current_user.rooms if user_signed_in?
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @user_rooms = current_user.rooms if user_signed_in?
    @members = @room.users
    @recipes = @room.recipes
    @comments = @room.room_comments.order(created_at: :desc)
    @comment = @room.room_comments.build
    @q = @room.recipes.ransack(params[:q])
    @recipes = @q.result(distinct: true).order(created_at: :desc)
    @tasks = @room.tasks.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @task = @room.tasks.new
  end

  def create
    @room = Room.new(room_params)
    @room.users << current_user
    @room.owner = current_user

    if @room.save
      redirect_to edit_room_path(@room), notice: "Room was successfully created."
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    @members = @room.users
    @new_member = User.new
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to room_path(@room), notice: "Room was successfully updated."
    else
      render :edit
    end
  end

  def invite_member
    @room = Room.find(params[:id])
    invite_name = params[:room][:invite_name]
    user = User.find_by(name: invite_name)

    if user
      @room.users << user
      redirect_to edit_room_path(@room), notice: "#{invite_name} さんをグループに招待しました！"
    else
      redirect_to edit_room_path(@room), alert: "#{invite_name} さんは登録されていません。"
    end
  end

  def destroy
    @room = Room.find(params[:id])

    if @room.owner == current_user
      @room.destroy
      redirect_to rooms_path, notice: "ルームを削除しました。"
    else
      redirect_to edit_room_path(@room), alert: "削除できるのはオーナーのみです。"
    end
  end

  def remove_member
    @room = Room.find(params[:id])
    user = User.find(params[:user_id])

    if @room.owner == current_user
      @room.users.delete(user) if @room.users.include?(user)
      redirect_to edit_room_path(@room), notice: "#{user.name} をグループから削除しました。"
    else
      redirect_to edit_room_path(@room), alert: "メンバーを削除できるのはオーナーのみです。"
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction)
  end
end
