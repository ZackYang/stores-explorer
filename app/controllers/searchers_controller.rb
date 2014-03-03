class SearchersController < ApplicationController
  
  def create
    searcher = Searcher.new params[:searcher]
    @stores = searcher.result
    render "stores/index"
  end
  
end
