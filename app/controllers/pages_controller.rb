class PagesController < ApplicationController

  before_filter :logged_in?
  #before_filter :login_required, :admin_required, :only => ['new', 'create', 'index']
  
  # GET /pages
  # GET /pages.xml
  
  def index
    
    @pages = Page.find(:all, :order => 'id')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end
  
  def pages_data
    @pages = Page.find(:all, :order => "id")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
     
      #@mangler = 'Indhold følger snarest'
       @pagetitle = @page.title rescue 'Indhold følger snarest'
        @content = @page.body rescue 'Indhold følger snarest'
        @headline = @page.headline rescue 'Indhold følger snarest'
        # if @page.image.length > 0 
        #            @image = @page.image
        #          else
        #            @image = 'forside.gif'
        #          end
        # 
        #          if @page.image_class.length > 0
        #            @image_class = @page.image_class
        #          else
        #            @image_class = 'foto_lille'
        #          end
      
     

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Siden blev oprettet!'
        format.html { redirect_to(:action => 'index') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Siden blev opdateret!'
        format.html { render :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = 'Siden blev slettet!'

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
end
