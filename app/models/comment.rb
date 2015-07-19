class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	default_scope { order('created_at DESC') }
	scope :recent, -> { order('created_at desc').limit(10) }
end
