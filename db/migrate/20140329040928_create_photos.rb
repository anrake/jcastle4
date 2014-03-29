class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.integer "castle_id"
    	t.integer "property_id"
    	t.string  "fullpicture"
	    t.string  "thumbnail"
	    t.integer "highlighted"
	    t.string  "highlightPict"
	    t.integer "ispanorama", :default => 0
	    t.string  "struct_type"
	    t.text    "description"
	    t.text    "shortDesc"
	    t.integer "vieworder"
	    t.string  "donatedBy"
	    t.string  "donatedByLink"
	    t.decimal "plat", :precision => 19, :scale => 14, :null => false
	    t.decimal "plong", :precision => 19, :scale => 14, :null => false
	    t.boolean "has_gps", :null => false
	    t.text    "descJse"
	    t.text    "shortDescJse"
	    t.boolean "hide_profile", :default => false, :null => false
      t.timestamps
    end
  end
end