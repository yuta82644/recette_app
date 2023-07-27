class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # Recipeをパラメータの値から探し出し、Recipeに紐づくcommentsとしてbuildします。
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user = current_user



    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to recipe_path(@recipe) }
      else
        format.html { redirect_to recipe_path(@recipe), notice: 'コメントを投稿できませんでした...' }
      end
    end
  end

  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:content)
  end
end
