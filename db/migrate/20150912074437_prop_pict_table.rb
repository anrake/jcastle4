class PropPictTable < ActiveRecord::Migration
  def self.up
    create_table :photos_properties, :id => false do |t|
      t.column :photo_id, :integer
      t.column :property_id, :integer
    end
  end
end