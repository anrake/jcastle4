class Rate < ActiveRecord::Base
  belongs_to :castle
  belongs_to :user
  default_scope { where('stars > 0') }
end
