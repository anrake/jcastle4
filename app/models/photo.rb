class Photo < ActiveRecord::Base
	belongs_to :imageable, polymorphic: true
	belongs_to :kokuin
end
