xml.instruct! :xml, :version => "1.0"
xml.markers {
  if @mappedpics.length < 1
    xml.marker do
     xml.name(@castle.castle_name_en)
     xml.nameja(@castle.castle_name_ja)
     xml.lat(@castle.clatitude)
     xml.lng(@castle.clongitude)
     xml.pic(@castle.highlighted.highlightPict)
     xml.id(@castle.highlighted.id)
      end
    
    else            
   @mappedpics.each do |pic|
      xml.marker do
       xml.name(pic.shortDesc)
       if pic.shortDescJse
         xml.nameja(pic.shortDescJse)
         else
           xml.nameja(pic.shortDesc)
       end 
       xml.lat(pic.plat)
       xml.lng(pic.plong)
       
       if pic.highlightPict.length > 1 
       xml.pic(pic.highlightPict)
          else
       xml.pic(pic.thumbnail)
      end
      xml.id(pic.id)
        end
      end
      end
}