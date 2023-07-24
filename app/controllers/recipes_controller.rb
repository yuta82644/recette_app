class RecipesController < ApplicationController
  # include RecipesHelper

  before_action :authenticate_user!, only: [:new, :create, :my_recipes]

  def index
    @recipes = Recipe.all
    # Other code for index action
  end

  def new
    @recipe = Recipe.new
    @recipe.procedures.build
    @recipe.cooking_ingredients.build
  end

  def create
  @recipe = Recipe.new(recipe_params)
  @recipe.user = current_user
  if @recipe.save
    redirect_to recipes_path(@recipe), notice: "レシピを投稿しました！"
  else
    puts @recipe.errors.full_messages # Add this line to display validation errors in the console
    render :new
  end
end

  # Other actions (show, edit, update, my_recipes, destroy)

  private

  def recipe_params
      params.require(:recipe).permit(
      :short_comment,
      :title,
      :tortal_quantity,
      :image,
      :public, # レシピに公開設定を保存するためのパラメータを追加
      :room_id, # レシピにルームIDを保存するためのパラメータを追加
      :public_post,
      procedures_attributes: [:procedure_comment, :_destroy],
      cooking_ingredients_attributes: [:ingredient_name, :quantity, :unit, :_destroy]
    )
  end

  def public_post?
    # public_post? method code
  end
end
