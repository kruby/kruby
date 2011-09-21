class ContentsController < ApplicationController
  
  #before_filter :login_required, :admin_required
  before_filter :current_controller #Findes i application_controller.rb
  before_filter :logged_in_as_admin?
  #before_filter :logged_in_as_user? #Findes i application_controller.rb
  
  def category_content
       @content = Content.find(params[:id])
       if @content.category == 'Admin'
         @content.category = 'Editor'
         #@content.priority = 2 #priority får en værdi så det bliver nemmere at sortere i index listen
       elsif @content.category == 'Editor'
         @content.category = 'User'
         #@content.priority = 3
       elsif @content.category == 'User'
         @content.category = 'Admin'
       elsif @content.category == nil
          @content.category = 'Admin'
         #@content.priority = 1
       end
       
       @content.update_attributes(params[:applicant])
            redirect_to(:action => 'index')   
  end
  
  # GET /contents
  # GET /contents.xml
  def index
    @contents = Content.find(:all, :order => "resource_type, resource_id")
    @types = Content.find(:all, :select => "distinct resource_type") 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.xml
  def show
    @content = Content.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.xml
  def new
    @content = Content.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.xml
  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if @content.save
        flash[:notice] = 'En post i content blev oprettet!'
        fformat.html { render :action => "index" }
        format.xml  { render :xml => @content, :status => :created, :location => @content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.xml
  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content])
        flash[:notice] = 'Content blev opdateret!'
        format.html { render :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.xml
  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    flash[:notice] = 'Kortet blev slettet!'
    

    respond_to do |format|
      format.html { redirect_to(contents_url) }
      format.xml  { head :ok }
    end
  end
end
