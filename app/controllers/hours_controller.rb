class HoursController < ApplicationController
  
  #before_filter :login_required, :admin_required
  before_filter :current_controller #Findes i application_controller.rb
  before_filter :logged_in_as_user? #Findes i application_controller.rb
  before_filter :logged_in_as_admin?, :except => ['timeliste', 'show_months_public', 'hide_months_public', 'show_days_public', 'hide_days_public']
    
  # GET /hours
  # GET /hours.xml
  def index
    @q = Hour.search(params[:q])
    @hours = @q.result.all
    #@search = Hour.search(params[:search])
    #@hours = @search.order('relation_id DESC, date DESC').all
      #DET ER VIGTIGT AT PLACERE ORDER HER, DA MAN SÅ OGSÅ HAR MULIGHED FOR AT SORTERE I SIT VIEW EFTERFØLGENDE
    
    #@hours = Hour.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hours }
    end
  end

  def show_years
    if params[:relation_id]
      session[:relation_id] = params[:relation_id]
      session[:year] = nil
      session[:month] = nil
    end
    @q = Hour.search(params[:q])
    @hours = @q.result.all
    render(:action => 'index')
  end

  def hide_years
    session[:relation_id] = nil
    session[:year] = nil
    session[:month] = nil
    @q = Hour.search(params[:q])
    @hours = @q.result.all
    render(:action => 'index')
  end
  
  def show_months
    if params[:relation_id]
      #session[:relation_id] = params[:relation_id]
      session[:year] = params[:year]
    end
    @q = Hour.search(params[:q])
    @hours = @q.result.all
    render(:action => 'index')
  end
  
  def hide_months
    #session[:relation_id] = nil
    session[:year] = nil
    @q = Hour.search(params[:q])
    @hours = @q.result.all
    render(:action => 'index')
  end
  
  def show_days
    if params[:month]
      session[:month] = params[:month]
    end
    @q = Hour.search(params[:q])
    @hours = @q.result.all
    render(:action => 'index')
  end
  
  def hide_days
    session[:month] = nil
    @q = Hour.search(params[:q])
    @hours = @q.result.all
    render(:action => 'index')
  end
  
  def show_months_public
    session[:month] = nil
    if params[:relation_id]
      session[:year] = params[:year]
    end
    @relation = Relation.find(session[:relation_id])
    @q = @relation.hours.search(params[:q])
    @hours = @q.result.order('date DESC').all
    render(:action => 'timeliste')
  end
  
  def hide_months_public
    session[:year] = nil
    session[:month] = nil
    @relation = Relation.find(session[:relation_id])
    @q = @relation.hours.search(params[:q])
    @hours = @q.result.order('date DESC').all
    render(:action => 'timeliste')
  end
  
  def show_days_public
    if params[:month]
      session[:month] = params[:month]
    end
    @relation = Relation.find(session[:relation_id])
    @q = @relation.hours.search(params[:q])
    @hours = @q.result.order('date DESC').all
    render(:action => 'timeliste')
  end
  
  def hide_days_public
    session[:month] = nil
    @relation = Relation.find(session[:relation_id])
    @q = @relation.hours.search(params[:q])
    @hours = @q.result.order('date DESC').all
    render(:action => 'timeliste')
  end
  
  def timeliste
    @relation = Relation.find(session[:relation_id])
    @q = @relation.hours.search(params[:q])
    @hours = @q.result.order('relation_id DESC, date DESC').all 
    #@hours = Hour.timeliste(current_user.relation_id).order('date desc')
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
    @q = Hour.search(params[:q])
    @hours = @q.result.order('relation_id DESC, date DESC').all
    render(:action => 'index')
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
