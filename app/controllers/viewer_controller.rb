class ViewerController < ApplicationController
  
  
  def show
    
    if params[:name]
      @page = Page.find_by_name(params[:name]) || Page.find_by_name('Forside')
    else
      @page = Page.find(params[:id]) || Page.find_by_name('Forside')
    end
    
    @pagetitle = 'Kruby - ' + @page.title rescue 'Indhold følger snarest'
    @content = @page.body rescue 'Indhold følger snarest'
    @headline = @page.headline rescue 'Indhold følger snarest'

    @posts = Post.forside_blogs_active.all(:limit => 6)

  end

  def forside

    #@page = Page.find_by_name(params[:name])
    @page = Page.find_by_name('Forside')
  
    @pagetitle = @page.title rescue 'Indhold følger snarest'
    @content = @page.body rescue 'Indhold følger snarest'
    @headline = @page.headline rescue 'Indhold følger snarest'
    @posts = Post.forside_blogs_active.all(:limit => 10)
    
    # if test_web_browser == "Firefox3"
    #       render :action => "show_bad_browsers"
    #     else
    #       render :action => "show"
    #     end
    
    render :action => "show"

  end


  def index
    @pagetitle = 'Overskrifter fra Viewercontroller!'
  end


  def product
    @pagetitle="Her viser vi alle kort i databasen"
    @fruit = Fruit.find_by_name(params[:name])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fruit }
    end
  end
  
  private

  def test_web_browser
    catch(:match) do
      ["Apple", "Firefox/3", "Firefox/2", "MSIE 6", "MSIE 7", "Opera"].each do |ua|
        throw(:match, ua.gsub(/[^a-z0-9]/i, "")) if request.user_agent =~ Regexp.new(ua)
      end
      nil
    end
  end

end
