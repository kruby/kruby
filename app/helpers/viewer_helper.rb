# -*- encoding : utf-8 -*-
module ViewerHelper
  
    def image
      if @image
  	    image_tag @image 
  	  end
	  end
	  
	  def pagetitle
	    "Velkommen til Kruby"
    end
end
