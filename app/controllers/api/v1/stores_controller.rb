class Api::V1::StoresController < ApplicationController
  
  before_filter :load_source, only: :show

  def show
    @store = @source_klass.find(params[:id])
    render json: @store
  end
  
  def create
    external_source = ExternalSource.create external_source_params
    render json: external_source.store
  end

  private
  
  def load_source
    @source_klass = params[:id].match(/[a-zA-Z]+/).to_s.blank? ? Store : ExternalSource
  end
  
  def external_source_params
    params.permit(
      :source,
      :last_api_call_at,
      :longitude,
      :source_id,
      :name,
      :address,
      :city,
      :state,
      :zip,
      :country,
      :url,
      :tel,
      :hours,
      :store_id,
      :latitude,
      :categories,
      :neighborhood
    )
  end

end