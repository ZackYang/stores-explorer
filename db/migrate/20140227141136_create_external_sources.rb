class CreateExternalSources < ActiveRecord::Migration
  def change
    create_table :external_sources, id: false do |t|
      t.string  :source, :source_id, :name, :address, :city, :state, :country, :neighborhood, :hours, :categories, :zip, :tel, :url
      t.integer :store_id
      t.decimal :latitude, :longitude, precision: 10, scale: 7
      t.datetime :last_api_call_at
      t.timestamps
    end
  end
end
