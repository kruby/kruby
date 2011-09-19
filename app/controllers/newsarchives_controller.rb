class NewsarchivesController < ApplicationController
  
  before_filter :current_controller #Findes i application_controller.rb
  before_filter :logged_in_as_admin? #Findes i application_controller.rb
  #before_filter :login_required, :editor_required, :only => ['new', 'create', 'index']
  
  # GET /newsarchives
  # GET /newsarchives.xml
  def index
    
    @newsarchives = Newsarchive.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsarchives }
    end
  end
  
  def newsarchives_data
    @newsarchives = Newsarchive.find(:all, :order => "id")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsarchives }
    end
  end
  

  # GET /newsarchives/1
  # GET /newsarchives/1.xml
  def show
    @page = Newsarchive.find(params[:id])

       @mangler = 'Indhold følger snarest'

        if (@page.blank? or @page.active == 'false' or @page.active.blank?)
          @pagetitle = @mangler
          @content = @mangler
          @headline = @mangler
          @image = 'forside.gif'
        else
          @pagetitle = @page.title
          @content = @page.text
          @headline = @page.title
          if @page.image?
            @image = @page.image
          else
            @image = 'forside.gif'
          end
        end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsarchive }
    end
  end

  # GET /newsarchives/new
  # GET /newsarchives/new.xml
  def new
    @newsarchive = Newsarchive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsarchive }
    end
  end

  # GET /newsarchives/1/edit
  def edit
    @newsarchive = Newsarchive.find(params[:id])
  end

  # POST /newsarchives
  # POST /newsarchives.xml
  def create
    @newsarchive = Newsarchive.new(params[:newsarchive])

    respond_to do |format|
      if @newsarchive.save
        flash[:notice] = 'Newsarchive was successfully created.'
        format.html { render :action => "index" }
        format.xml  { render :xml => @newsarchive, :status => :created, :location => @newsarchive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsarchive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newsarchives/1
  # PUT /newsarchives/1.xml
  def update
    @newsarchive = Newsarchive.find(params[:id])

    respond_to do |format|
      if @newsarchive.update_attributes(params[:newsarchive])
        flash[:notice] = 'Newsarchive blev opdateret.'
        format.html { render :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsarchive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newsarchives/1
  # DELETE /newsarchives/1.xml
  def destroy
    @newsarchive = Newsarchive.find(params[:id])
    @newsarchive.destroy
    flash[:notice] = 'Nyheden blev slettet!'

    respond_to do |format|
      format.html { redirect_to(newsarchives_url) }
      format.xml  { head :ok }
    end
  end
end
