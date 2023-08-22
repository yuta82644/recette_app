class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :my_recipes, :edit]

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)

    if params[:room_id]
      @room = Room.find(params[:room_id])
      @recipes = @room.recipes.where(public: true).ransack(params[:q]).result(distinct: true).order(created_at: :desc)
    else
      @recipes = @recipes.where(public: true).order(created_at: :desc)
    end
  end

  def new
    @recipe = Recipe.new
    @recipe.procedures.build
    @recipe.cooking_ingredients.build
    @user_rooms = user_signed_in? ? current_user.rooms : []
    @public_post = public_post?
    @categories = Category.all
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    @user_rooms = current_user.rooms

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "レシピを投稿しました！"
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    @comment = @recipe.comments.build
    @comments = @recipe.comments.order(created_at: :desc)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user_rooms = user_signed_in? ? current_user.rooms : []
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "レシピを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to my_recipes_recipes_path, notice: "レシピを削除しました"
  end

  def my_recipes
    @q = current_user.recipes.ransack(params[:q])
    @user_recipes = @q.result(distinct: true)
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :short_comment,
      :title,
      :tortal_quantity,
      :image,
      :public,
      :room_id,
      :public_post,
      :image_cache,
      procedures_attributes: [:procedure_comment,:id, :_destroy],
      cooking_ingredients_attributes: [:id, :ingredient_name, :quantity, :unit, :_destroy],
      category_ids: []
    )
  end

  def public_post?
    params["recipe"] && params["recipe"]["public_post"].present?
  end
end
