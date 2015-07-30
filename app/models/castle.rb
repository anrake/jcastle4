class Castle < ActiveRecord::Base
	has_many :photos, as: :imageable
	has_one :highlighted, -> { order(highlighted: :DESC) }, :class_name => 'Photo'
	accepts_nested_attributes_for :photos
	has_many :comments, :as => :commentable, :dependent => :destroy
	has_many :rates

def average_rating
  rates.sum(:stars) / rates.size
end

end
