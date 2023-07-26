class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:show, :new, :create, :my_recipes]

  def index
    if params[:room_id]
      @room = Room.find(params[:room_id])
      @recipes = Recipe.where(public: true)
    else
      @recipes = Recipe.where(public: true)
    end
  end

  def new
    @recipe = Recipe.new
    @recipe.procedures.build
    @recipe.cooking_ingredients.build
    @user_rooms = user_signed_in? ? current_user.rooms : []
    @public_post = public_post?
    @categories = Category.all
    @categroy = Category.new
  end

  def create
      @recipe = Recipe.new(recipe_params)
      @recipe.user = current_user

      if @recipe.save
        redirect_to recipes_path(@recipe), notice: "レシピを投稿しました！"
      else
        render :new
      end
    end
  



  def show
    @recipe = Recipe.find(params[:id])
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipes_path(@recipe), notice: "レシピを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to my_recipes_recipes_path
  end

  def my_recipes
    @user_recipes = current_user.recipes
  end

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
      :image_cache,
      procedures_attributes: [:procedure_comment, :_destroy],
      cooking_ingredients_attributes: [:ingredient_name, :quantity, :unit, :_destroy],
      category_ids: []
    )
  end
  

  def public_post?
     params["recipe"] && params["recipe"]["public_post"].present?
  end
end
