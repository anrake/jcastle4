class Page < ActiveRecord::Base
	  belongs_to :user
	  has_and_belongs_to_many :castles, :order => 'castle_name_en'


	  def castle_lookup
	  	Castle.try(:castle_name_en)
	  end

	  def castle_lookup=(castle_name)
	  	self.castle = Castle.where(castle_name_en: castle_name) if castle_name.present?
	  end

end


