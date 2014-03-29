class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
	    t.string  "name_en"
	    t.string  "name_ja"
	    t.string  "name_r"
	    t.integer "resource_id"
	    t.integer "resourceType"
	    t.string  "fullpicture"
	    t.string  "thumbnail"
	    t.text    "description"
	    t.text    "shortDesc"
	    t.integer "vieworder"
	    t.decimal "rlat", :precision => 19, :scale => 14
	    t.decimal "rlong", :precision => 19, :scale => 14
	    t.boolean "has_gps"
	    t.text    "descJse"
	    t.text    "shortDescJse"
	    t.string  "highlightPict"
      t.timestamps
    end
  end
end