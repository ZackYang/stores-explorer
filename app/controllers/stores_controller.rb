class StoresController < ApplicationController
  
  def index
    @searcher = Searcher.new
  end
  
end
