class RoomsController < ApplicationController

  def index
    if user_signed_in?
      @user_rooms = current_user.rooms
    else
      @user_rooms = []
    end
  end
  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @user_rooms = current_user.rooms
    @members = @room.users

    @recipes = @room.recipes

# コメント機能
  @comments = @room.room_comments.order(created_at: :desc)
  @comment = @room.room_comments.build

  # 検索
  @q = @room.recipes.ransack(params[:q])
  @recipes = @q.result(distinct: true).order(created_at: :desc)

   @tasks = @room.tasks.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @task = @room.tasks.new
  
  end

  def create
    @room = Room.new(room_params)
    @room.owner = current_user
    if @room.save
      redirect_to room_path(@room), notice: "Room was successfully created."
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
    invite_name = params[:room][:invite_name]
    user = User.find_by(name: invite_name)

    if user
      @room.users << user
      redirect_to room_path(@room), notice: "#{invite_name} さんをグループに招待しました！"
    else
      redirect_to edit_room_path(@room), alert: "#{invite_name} さんは登録されていません。"
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction,)
  end
end
