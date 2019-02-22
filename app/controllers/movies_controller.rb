class MoviesController < ApplicationController
  def index
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
    @movie = Movie.new(constructor_params)

    if @movie.save
      redirect_to constructor_index_path,
        notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(constructor_params)
      redirect_to constructor_index_path,
        notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to constructor_index_path, notice: 'Movie was successfully destroyed.'
  end

  private
  def constructor_params
    params.require(:movie).permit(:title, :user_id, :category_id)
  end
end
