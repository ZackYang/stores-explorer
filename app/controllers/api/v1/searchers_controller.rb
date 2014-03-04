class Api::V1::SearchersController < ApplicationController
  
  def create
    searcher = Searcher.new params[:searcher]
    render json: searcher.result
  end
  
end
