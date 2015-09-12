class Castle < ActiveRecord::Base
	has_many :photos, as: :imageable
	has_one :highlighted, -> { order(highlighted: :DESC) }, :class_name => 'Photo'
	has_many :comments, :as => :commentable, :dependent => :destroy
	has_many :rates
	has_and_belongs_to_many :pages
	has_many :visits, :dependent => :destroy
	accepts_nested_attributes_for :photos, :pages, :visits


def average_rating
  rates.sum(:stars) / rates.size
end

end
