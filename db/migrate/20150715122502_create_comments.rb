class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :comment
    	t.references :commentable, polymorphic: true
    	t.string :commenter, :default => "Anonymous"
    	t.string :commenter_website
    	t.string :commenter_email
    	t.integer :page_id
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end