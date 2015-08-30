class CastlesPages < ActiveRecord::Migration
	def change
		create_table :castles_pages, :id => false do |t|
			t.column :castle_id, :integer
			t.column :page_id, :integer
		end
	end
end