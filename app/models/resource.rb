class Resource < ActiveRecord::Base
	has_many :photos, as: :imageable
end
