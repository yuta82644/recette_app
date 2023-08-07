class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    
  end
  
  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_category_path, notice: "カテゴリーを作成しました！"
    else
      render :new
    end
  end

  def destroy
    if @category.user == current_user
      @category.destroy
      redirect_to categories_path, notice: "カテゴリーを削除しました！"
    else
      redirect_to categories_path, alert: "このカテゴリーの削除は許可されていません。"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
