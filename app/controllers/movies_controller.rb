class MoviesController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_movies = current_user.movies
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to root_path,
        notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to root_path,
        notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path, notice: 'Movie was successfully destroyed.'
  end

  def create_rating
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to homepage_path(@rating.movie.category),
                      notice: 'Rating was successfully created.'}
      else
        format.html { redirect_to homepage_path(@rating.movie.category),
                      notice: 'you have already voted.'}
      end
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :user_id, :category_id)
  end

  def rating_params
    params.require(:rating).permit(:star, :user_id, :movie_id)
  end
end
