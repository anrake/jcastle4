class Property < ActiveRecord::Base
  belongs_to :castle
  has_and_belongs_to_many :photos
  
#  acts_as_cache_clearer
  
##  after_save :update_photos  
    
  def update_photos
            
    self.photos.clear
    if self.photos_list.length > 0
    for photo_id in self.photos_list.split
      @photo = Photo.find(photo_id)
      self.photos<<(@photo)
    end
  end
end
  
#  def to_param
#          "#{id}-#{castle.castle_name_en.gsub(/[^a-z1-9]+/i, '-')}"
#  end
  
end
