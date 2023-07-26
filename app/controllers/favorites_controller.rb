class FavoritesController < ApplicationController
  before_action :authenticate_user!


  def index
    @favorites = current_user.favorites.includes(:recipe)
  end
  def create
    favorite = current_user.favorites.create(recipe_id: params[:recipe])
    redirect_to recipes_path, notice: "#{favorite.recipe.user.name}さんのレシピをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to recipes_path, notice: "#{favorite.recipe.user.name}さんのレシピをお気に入り解除しました"
  end
end
