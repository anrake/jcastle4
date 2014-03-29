class CreateKokuins < ActiveRecord::Migration
  def change
    create_table :kokuins do |t|
	    t.string   "thumbnail"
	    t.text     "known_users"
	    t.text     "description"
	    t.text     "shortDesc"
	    t.text     "descJse"
	    t.text     "shortDescJse"
	    t.string   "ktype"
	    t.string   "ktype2"
	    t.integer  "strokes"
      t.timestamps
    end
  end
end
