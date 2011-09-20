class HoursController < ApplicationController
  
  #before_filter :login_required, :admin_required
  before_filter :current_controller #Findes i application_controller.rb
  before_filter :logged_in? #Findes i application_controller.rb
  before_filter :logged_in_as_admin?, :except => ['timeliste']
  
  # GET /hours
  # GET /hours.xml
  def index
    #Product.order(:released_at.desc)
    #@search = Hour.order(:relation_id.desc).search(params[:search])
    @search = Hour.search(params[:search])
    @hours = @search.order(:relation_id.desc).all
    #DET ER VIGTIGT AT PLACERE ORDER HER, DA MAN SÅ OGSÅ HAR MULIGHED FOR AT SORTERE I SIT VIEW EFTERFØLGENDE
    
    #@hours = Hour.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hours }
    end
  end
  
  def timeliste
    @search = Hour.search :relation_id_equals => session[:relation_id]
    @hours = @search.all 
    #@hours = Hour.timeliste(current_user.relation_id).order('date desc')
    @relation = Relation.find(session[:relation_id])
    
  end

  # GET /hours/1
  # GET /hours/1.xml
  def show
    @hour = Hour.find(params[:id])

    redirect_to(:action => 'index')
    # respond_to do |format|
    #       format.html # show.html.erb
    #       format.xml  { render :xml => @hour }
    #     end
  end

  # GET /hours/new
  # GET /hours/new.xml
  def new
    @hour = Hour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hour }
    end
  end

  # GET /hours/1/edit
  def edit
    #@hour = Hour.find(params[:id])
    session[:hour_id] = params[:id]
    redirect_to(:action => 'index')
  end

  # POST /hours
  # POST /hours.xml
  def create
    @hour = Hour.new(params[:hour])

    respond_to do |format|
      if @hour.save
        flash[:notice] = 'Timeregistreringen blev oprettet!'
        session[:hour_id] = params[:id]
        format.html { redirect_to(:action => 'index') }
        format.xml  { render :xml => @hour, :status => :created, :location => @hour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hours/1
  # PUT /hours/1.xml
  def update
    @hour = Hour.find(params[:id])

    respond_to do |format|
      if @hour.update_attributes(params[:hour])
        flash[:notice] = 'Timeregistreringen blev opdateret.'
        session[:hour_id] = nil
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hours/1
  # DELETE /hours/1.xml
  def destroy
    @hour = Hour.find(params[:id])
    @hour.destroy

    respond_to do |format|
      format.html { redirect_to(hours_url) }
      format.xml  { head :ok }
    end
  end
end
