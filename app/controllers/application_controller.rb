 # Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  
  helper :all # include all helpers, all the time
  
  # See ActionController::RequestForgeryProtection for details vi ændrer lidt
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9cae1eb8594a7b89643fabe15981bf87'
  
  #include AuthenticatedSystem
  
  before_filter :get_content_for_menu
  
  def get_content_for_menu
    #Menupunkter i forhold til user.category skal hentes. Er man editor, får man kun aktuelle menupunkter at se.
    #get_subdomain_pages
    
    @main_menu ||= Content.main_menu # main_menu kommer fra content.rb
    
    # if logged_in?
    #   if current_user.category == 'Admin' 
    #     @tabs ||= Content.admin_pages + Content.editor_pages + Content.user_pages
    #     # parent_pages kommer fra content.rb (modellen) derfor starter den også med Content. det har ikke noget med tabellen contents at gøre.
    #     @tabs_main ||= @main_menu
    #   elsif current_user.category == 'Editor'
    #     @tabs ||= Content.editor_pages + Content.user_pages
    #     @tabs_main ||= @main_menu
    #   elsif current_user.category == 'User'
    #     @tabs ||= Content.user_pages
    #     @tabs_main ||= @main_menu
    #   end
    # else
    #   @tabs_main ||= Content.public_pages
    #   
    # end
    
    @tabs ||= Content.admin_pages + Content.editor_pages + Content.user_pages
    #@tabs_main ||= @main_menu
    @tabs_main ||= Content.public_pages
    
    

  end
  
  
  # def get_content_for_menu
  #   #Menupunkter i forhold til user.category skal hentes. Er man editor, får man kun aktuelle menupunkter at se.
  #   if logged_in?
  #     if current_user.category == 'Admin' 
  #       @tabs ||= Content.admin_pages # parent_pages kommer fra content.rb (modellen) derfor starter den også med Content. det har ikke noget med tabellen contents at gøre.
  #     elsif current_user.category == 'Editor'
  #       @tabs ||= Content.editor_pages
  #     elsif current_user.category == 'User'
  #       @tabs ||= Content.user_pages
  #     end
  #     
  #   else
  #     @tabs ||= Content.public_pages # public_pages kommer fra content.rb (modellen)
  #   end
  #   
  #   @main_menu ||= Content.pages.active.not_admin # main_menu kommer fra content.rb
  #   
  #   
  #   @mangler = 'Indhold følger snarest'
  #   
  #   #Newsarchive.active kommer fra models > newsarchive.rb via scope
  #   @archives = Newsarchive.active
  #   @products = Product.active
  #   
  # end


  def active
   active_controller = params[:controller].classify.constantize
   @active_controller = active_controller.find(params[:id])
   if @active_controller.active
     @active_controller.active = 0
     #flash[:notice] = 'Jobbet blev til nul'
   else
     @active_controller.active = 1
   #flash[:notice] = 'Jobbet blev til 1'
   end
   
   @active_controller.update_attributes(params[:active_controller])
   
   redirect_to(:action => 'index')
  end
  
  def active_admin
   active_controller = params[:controller].classify.constantize
   @active_controller = active_controller.find(params[:id])
   if @active_controller.admin
     @active_controller.admin = 0
     #flash[:notice] = 'Jobbet blev til nul'
   else
     @active_controller.admin = 1
   #flash[:notice] = 'Jobbet blev til 1'
   end
   
   @active_controller.update_attributes(params[:active_controller])
   
   redirect_to(:action => 'index')
  end
  
  def active_redirect
   active_controller = params[:controller].classify.constantize
   @active_controller = active_controller.find(params[:id])
   if @active_controller.redirect
     @active_controller.redirect = 0
     #flash[:notice] = 'Jobbet blev til nul'
   else
     @active_controller.redirect = 1
   #flash[:notice] = 'Jobbet blev til 1'
   end
   
   @active_controller.update_attributes(params[:active_controller])
   
   redirect_to(:action => 'index')
  end

  def admin
    
     admin_controller = params[:controller].classify.constantize
     @active_controller = admin_controller.find(params[:id])
     if @active_controller.admin
       if User.admin.count < 2 #Her sørges der for, at der altid er mindst 1 admin blandt Users
         #redirect_to(:controller => 'users', :action => 'index')
         flash[:notice] = 'Kan ikke ændres. Altid mindst én admin tilgængelig'
       else
         @active_controller.admin = 0
       end
       #flash[:notice] = 'Jobbet blev til nul'
     else
       @active_controller.admin = 1
     #flash[:notice] = 'Jobbet blev til 1'
     end
   
     @active_controller.update_attributes(params[:admin_controller])
   
     redirect_to(:action => 'index')
  end
  
  
  def category
    
     category_controller = params[:controller].classify.constantize
     @category_controller = category_controller.find(params[:id])
         if @category_controller.category == 'Admin'
            if User.admin.count < 2 #Her sørges der for, at der altid er mindst 1 admin blandt Users
              #redirect_to(:controller => 'users', :action => 'index')
              flash[:notice] = 'Kan ikke ændres. Altid mindst én admin tilgængelig'
            else
              @category_controller.category = 'Editor'
            end
         elsif @category_controller.category == 'Editor'
           @category_controller.category = 'User'
         elsif @category_controller.category == 'User'
           @category_controller.category = 'Public'
         elsif @category_controller.category == 'Public'
            @category_controller.category = 'Admin'
         end

     @category_controller.update_attributes(params[:category_controller])
   
     redirect_to(:action => 'index')
  end

  def migrate_data
    
    @menus = Menu.find(:all, :order => "id")
    @newsarchives = Newsarchive.find(:all, :order => "id")
    @pages = Page.find(:all, :order => "id")
    @posts = Post.find(:all, :order => "id")
    @products = Product.find(:all, :order => "id")
    @relations = Relation.find(:all, :order => "id")
    @users = User.find(:all, :order => "id")
    # @content_menus = Content.find(:conditions => ["controller_name = 'Menu'", true], :order => "resource_id")
    #    @content_pages = Content.find(:conditions => ["controller_name = 'Page'", true], :order => "resource_id")
    #    @content_product = Content.find(:conditions => ["controller_name = 'Product'", true], :order => "resource_id")
   
  end
  
  #NY AUTHENTICATION FOR RAILS3
  
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  protected

    def logged_in?
      unless session[:user_id]
        flash[:notice] = "Du skal først logge ind."
        redirect_to log_in_path
        return false
      else
        return true
      end
    end
end
#GAMMELT
#@subpages = Page.subpages
#@admin = Page.public_pages
#@pages = Page.main_pages