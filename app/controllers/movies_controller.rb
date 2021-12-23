class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = Movie.page(params[:page]).reverse_order
  end

  def show
  end

  def new
  end
end
