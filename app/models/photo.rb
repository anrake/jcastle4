class Photo < ActiveRecord::Base
	belongs_to :imageable, polymorphic: true
	has_many :kokuin_matches
	has_many :kokuins, through: :kokuin_matches
	has_many :comments, :as => :commentable, :dependent => :destroy
	has_many :tags, :dependent => :destroy
	accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? }}

#	accepts_nested_attributes_for :kokuin_matches, :allow_destroy => true

end
