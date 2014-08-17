class Castle < ActiveRecord::Base
	has_many :photos, as: :imageable
	has_one :highlighted, :class_name => 'Photo', :order => 'highlighted DESC'
end
