class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
      @genre = Genre.new
      render :form
  end

  def create
      @genre = Genre.new(genre_params)
      @genre.save
      redirect_to genre_path(@genre)
  end

  def show
      @genre = Genre.find(params[:id])
  end

  def edit
      @genre = Genre.find(params[:id])
      render :form
  end

  def update
      @genre = Genre.find(params[:id])
      @genre.update(genre_params)
      redirect_to genre_path(@genre)
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
