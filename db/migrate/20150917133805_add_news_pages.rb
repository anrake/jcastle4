class AddNewsPages < ActiveRecord::Migration
  def change
  	  change_table :pages do |t|
		t.column :contentJse, :text
		t.column :short_descJse, :text
		t.column :titleJse, :string
    	t.boolean :published, :default => false
    	t.column :highlight, :string
	  end
  end
end
