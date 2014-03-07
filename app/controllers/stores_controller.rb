class StoresController < ApplicationController
  
  before_filter :load_source, only: :show

  def show
    @store = @source_klass.find(params[:id])
    render layout: nil
  end

  private
  
  def load_source
    @source_klass = params[:id].match(/[a-zA-Z]+/).to_s.blank? ? Store : ExternalSource
  end
  
end
