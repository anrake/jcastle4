class CreateTagmaps < ActiveRecord::Migration
  def change
    create_table :tagmaps do |t|
      t.column :tag_name, :string
      t.column :tag_resource, :string      
      t.timestamps null: false
    end
  end
end
