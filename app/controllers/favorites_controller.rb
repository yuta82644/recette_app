class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = current_user.favorites.includes(recipe: :categories).ransack(params[:q])
    @favorites = @q.result(distinct: true)
  end

  def create
    favorite = current_user.favorites.create(recipe_id: params[:recipe])
    redirect_to recipe_path(params[:recipe]), notice: "#{favorite.recipe.user.name}さんのレシピをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to recipe_path(favorite.recipe_id), notice: "#{favorite.recipe.user.name}さんのレシピをお気に入り解除しました"
  end
end
