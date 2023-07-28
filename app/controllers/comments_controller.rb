class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # Recipeをパラメータの値から探し出し、Recipeに紐づくcommentsとしてbuildします。
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user = current_user


    respond_to do |format|
      if @comment.save
        format.js {render :index}
      else
        format.html { redirect_to recipe_path(@recipe), notice: 'コメントを投稿できませんでした...' }
      end
    end
  end

  def edit 
  @recipe = Recipe.find(params[:recipe_id])
  @comment = @recipe.comments.find(params[:id])
  respond_to do |format|
    flash.now[:notice] = 'コメントの編集中'
    format.js { render :edit }
    

    
  end
end

  def update
  @recipe = Recipe.find(params[:recipe_id])  # 修正：@recipe を先に定義する
  @comment = @recipe.comments.find(params[:id])
  
  respond_to do |format|
    if @comment.update(comment_params)
      flash.now[:notice] = 'コメントが編集されました'
      format.js { render :index }
    else
      flash.now[:notice] = 'コメントの編集に失敗しました'
      format.js { render :edit }
    end
  end
end


  def destroy
  @recipe = Recipe.find(params[:recipe_id])  # 修正：@recipe を先に定義する
  @comment = @recipe.comments.find(params[:id])
  
  @comment.destroy
  respond_to do |format|
    flash.now[:notice] = 'コメントが削除されました'
    format.js { render :index }
  end
end

class RoomsController < ApplicationController
  # 他のアクションは省略...

  def create_comment
    @room = Room.find(params[:id])
    @comment = @room.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to room_path(@room), notice: 'コメントを投稿できませんでした...' }
      end
    end
  end

  def destroy_comment
    @comment = Comment.find(params[:comment_id])
    @room = @comment.room
    @comment.destroy

    respond_to do |format|
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end


  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:content)
  end
end
