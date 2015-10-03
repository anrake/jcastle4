class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.column :photo_id, :integer
      t.column :tag_group, :string
      t.column :tag_name, :string
      t.column :sub_tag, :string
      t.column :description, :text
	    t.timestamps null: false
    end
  end
end