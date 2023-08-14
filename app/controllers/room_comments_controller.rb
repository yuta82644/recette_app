class RoomCommentsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @room_comment = @room.room_comments.build(room_comment_params)
    @room_comment.user = current_user

    respond_to do |format|
      if @room_comment.save
        @comments = @room.room_comments.reload
        format.js { render :index }
      else
        format.html { redirect_to room_path(@room), notice: 'コメントを投稿できませんでした...' }
      end
    end
  end

  def edit
    @room = Room.find(params[:room_id])
    @room_comment = @room.room_comments.find(params[:id])

    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @room = Room.find(params[:room_id])
    @room_comment = @room.room_comments.find(params[:id])

    respond_to do |format|
      if @room_comment.update(room_comment_params)
        @comments = @room.room_comments.reload
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @room_comment = @room.room_comments.find(params[:id])

    @room_comment.destroy
    respond_to do |format|
      @comments = @room.room_comments
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def room_comment_params
    params.require(:room_comment).permit(:content)
  end
end
