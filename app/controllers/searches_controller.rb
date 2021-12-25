class SearchesController < ApplicationController
  def search
     search = params[:search]
     @word = params[:word]
    if @range == '1'
    @review = Review.title.search(search,@word)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
