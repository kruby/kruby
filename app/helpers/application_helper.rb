# Methods added to this helper will be available to all templates in the application.
# Du kan ikke få adgang til metoder her fra din controller, kun fra dine views
module ApplicationHelper
  
  # def test_web_browser()
  #   request.env["HTTP_USER_AGENT"].gsub(/[^A-Za-z0-9]/, '')
  # end
  
  # def test_web_browser
  #    catch(:match) do
  #      ["Apple", "Firefox/3", "Firefox/2", "MSIE 6", "MSIE 7", "Opera"].each do |ua|
  #        throw(:match, ua.gsub(/[^a-z0-9]/i, "")) if request.user_agent =~ Regexp.new(ua)
  #      end
  #      nil
  #    end
  #  end
  
  def google_font_link_tag(family)
    tag('link', {:rel => :stylesheet, :type => Mime::CSS, :href => "http://fonts.googleapis.com/css?family=#{family}"}, false, false)
  end
     
  def google_analytics_js
    "<script type='text/javascript'>
  
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-20355035-1']);
      _gaq.push(['_trackPageview']);
  
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
  
    </script>"
  end
  
  def image
      if @image
        if @image_class
  	      image_tag(@image, :class => @image_class)
	      else
	        image_tag(@image, :class => 'foto_lille')
	      end
	    else
	      image_tag('/images/forside.gif', :class => 'foto_lille')
  	  end
	end
	  
  # def active
  #     @aktiv_besked = "Hvis siden ikke er aktiv, kan 'hackere' ikke se den via ændring i URL"
  #   end
    
  def nice_timestamp(timestamp)
    h timestamp.strftime("%d.%m.%y - %H:%M")
  end
    
  def nice_date(datoen)
      return datoen.strftime('%d.%m.%y')
  end
  
  def nice_time(tiden)
    return tiden.strftime(' - %H:%M')
  end
  
  def wingedoff(modtaget)
    if modtaget == true
    	return '√' 
    else 
    	return '–' 
    end
  end
  
  def active_test(active)
    if active == true
  			@aktiv = '√' 
  	else 
  			@aktiv = '–' 
  	end
  end
  
  def autotab
    @current_tab ||= 0
    @current_tab += 1
  end
  
   
end
