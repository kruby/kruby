class UsersController < ApplicationController
  
  #before_filter :logged_in_as_user?
  before_filter :current_controller #Findes i application_controller.rb
  before_filter :logged_in_as_admin?, :except => ['no_access_admin']

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action => 'index'
      flash[:notice] = "Brugeren " + @user.name + " blev oprettet!"
    else
      render "new"
    end
  end

  def active
   active_controller = params[:controller].classify.constantize
   @active_controller = active_controller.find(params[:id])
   if @active_controller.active
     @active_controller.active = nil
     #flash[:notice] = 'Jobbet blev til nul'
   else
     @active_controller.active = 1
   #flash[:notice] = 'Jobbet blev til 1'
   end
   
   @active_controller.update_attributes(params[:active_controller])
   
   redirect_to(:action => 'index')
  end
  
  def no_access_admin
    #Der er her blot for at kunne lede hen til det rigtige layout
  end
  
  def index
   @users = User.find(:all)
  end

  def show
   @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.category == 'Admin'
       if User.admin.count < 2
         flash[:notice] = 'Kan ikke slettes. Altid mindst én admin tilgængelig'
         redirect_to(:action => 'index')
       else
          @user.destroy
          flash[:notice] = 'Brugeren ' + @user.name + ' blev slettet!'
          redirect_to(users_url)
       end
    else
      @user.destroy
      flash[:notice] = 'Brugeren ' + @user.name + ' blev slettet!'
      redirect_to(users_url) 
     end
   
  end
   
   def edit
    @user = User.find(params[:id])
   end
  
   def update
     @user = User.find(params[:id])

     if @user.category == 'Admin' and params[:user][:category] != 'Admin'
        
        if User.admin.count < 2
          flash[:notice] = 'Kan ikke ændres. Altid mindst én admin tilgængelig'
          redirect_to(:action => 'index')
        else
           update_now
        end
        
     else
       update_now 
     end
   end
   
   
   def update_now
      respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'Brugeren blev opdateret!'
          #format.html { redirect_to(user_path(@user)) }
          format.html { redirect_to(:action => 'index') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
   end
  
end