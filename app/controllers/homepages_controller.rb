class HomepagesController < ApplicationController
  def index
  	@movies = Movie.all
  end
end