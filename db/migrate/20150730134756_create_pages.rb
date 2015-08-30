class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.integer :user_id
    	t.string :title
    	t.text :content
    	t.text :short_desc
    	t.string :page_type
	    t.string :comment_pref, :default => "1"
    	t.string :rating_pref,  :default => "MyRatings"
      t.timestamps null: false
    end
  end
end
