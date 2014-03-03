class CreateStores < ActiveRecord::Migration
  def change
    create_table "stores" do |t|
      t.string :name, :address, :city, :state, :country, :neighborhood, :hours, :categories, :zip, :tel, :url
      t.decimal :latitude, :longitude, precision: 10, scale: 7
      t.timestamps
    end
  end
end
