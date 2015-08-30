class AddUserIdPhotos < ActiveRecord::Migration
  def change 
  	change_table :photos do |t|
			t.column :user_id, :integer
	  end
  end
end
