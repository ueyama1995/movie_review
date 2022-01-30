class SearchesController < ApplicationController
  def search
     @range = params[:range]
     search = params[:search]
     @word = params[:word]
    if @range == 'title'
    @review = Review.search(search,@word)
    @review = @review.page(params[:page]).reverse_order.per(10)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
