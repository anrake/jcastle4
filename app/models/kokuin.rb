class Kokuin < ActiveRecord::Base
	has_many :kokuin_matches
	has_many :photos, through: :kokuin_matches
	accepts_nested_attributes_for :kokuin_matches, :allow_destroy => true
	has_many :comments, :as => :commentable, :dependent => :destroy
end
