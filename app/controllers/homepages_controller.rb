class HomepagesController < ApplicationController
  def index
  	@categories = Category.left_joins(:movies)
						  .group(:id)
						  .order('COUNT(movies.id) DESC')
  end

  def show
  	@category = Category.find(params[:id])
  	@category = @category.movies
  end
end