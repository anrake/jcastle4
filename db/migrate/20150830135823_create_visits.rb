class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
		t.integer :castle_id
		t.string :visit_year
        t.timestamps null: false
    end
  end
end