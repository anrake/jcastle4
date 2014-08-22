class CreateKokuinMatch < ActiveRecord::Migration
  def change
    create_table :kokuin_matches do |t|
    	t.belongs_to :kokuin
    	t.belongs_to :photo
    	t.boolean "combination", :default => false
    end
  end
end
