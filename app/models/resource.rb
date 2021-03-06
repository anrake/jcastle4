class Resource < ActiveRecord::Base
	has_many :photos, as: :imageable
	has_one :highlighted, -> { order(highlighted: :DESC) }, :class_name => 'Photo'
	accepts_nested_attributes_for :photos
	has_many :comments, :as => :commentable, :dependent => :destroy
end
