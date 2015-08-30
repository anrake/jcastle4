class AddUserIntro < ActiveRecord::Migration
  def change
  	  change_table :users do |t|
			t.column :self_intro, :text
	  end
  end
end
