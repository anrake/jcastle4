class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :castle, index: true
      t.references :user, index: true
      
      t.integer :stars, :default => 0
      t.timestamps null: false
    end
    add_foreign_key :rates, :castles
    add_foreign_key :rates, :users
  end
end
