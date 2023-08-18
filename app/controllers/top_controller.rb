class TopController < ApplicationController
    before_action :skip_index_for_logged_in_users, only: :index

  def index
  end
  

  private

  def skip_index_for_logged_in_users
    if user_signed_in?
      redirect_to recipes_path
    end
  end
end