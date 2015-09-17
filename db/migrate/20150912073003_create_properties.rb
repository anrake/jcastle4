class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
			t.integer :castle_id
			t.string :NameCastle
			t.string :structure
			t.string :propertyType
			t.string :structureType
			t.string :yearBuilt
			t.string :photos_list
      t.timestamps null: false
    end
  end
end
