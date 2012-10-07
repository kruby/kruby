class PostsController < ApplicationController
  
  # before_filter :login_required, :user_required, :except => ['show']
  
  before_filter :current_controller #Findes i application_controller.rb
  #before_filter :logged_in_as_user? #Findes i application_controller.rb
  before_filter :logged_in_as_admin?, :except => ['show']
  
  layout 'viewer'
  
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.search(params[:search], params[:page])
    #@posts = Post.find(:all)
    render :layout => 'application'
    # respond_to do |format|
    #       format.html # index.html.erb
    #       format.xml  { render :xml => @posts }
    #     end
  end
  
  
  def show
    session[:single_blog] = true
    @post = Post.find(params[:id])
    if @post.parent_id? == true
      @post = Post.find(@post.parent_id)
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  # def show_single_blog
  #     session[:single_blog] = true
  #     @post = Post.find(params[:id])
  #     render(:action => 'show')
  # 
  #     # respond_to do |format|
  #     #       format.html # show.html.erb
  #     #       format.xml  { render :xml => @post }
  #     #     end
  #   end
  
  # GET /posts/new
  # GET /posts/new.xml
  def new
    session[:single_blog] = nil
    @post = Post.new
    # @assetable = Assetable.find(:all)
    
    render :layout => 'application'

    # respond_to do |format|
    #       format.html # new.html.erb
    #       format.xml  { render :xml => @post }
    #     end
  end
  
  def new_asset_line
    @assetable = Assetable.new

    # respond_to do |format|
    #       format.html # new.html.erb
    #       format.xml  { render :xml => @post }
    #     end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @attachments = Attachment.find_all_by_attachable_id(params[:id])
    
    render :layout => 'application'
 
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Indlægget blev oprettet.'
        #format.html { redirect_to(@post) }
        # if session[:single_blog] == true
        #           redirect_to(:action => 'show_single_blog', :id => session[:post_id])
        #         else
          format.html { redirect_to(:action => 'index') }
          #format.html { redirect_to(:action => 'list') }
          # format.xml  { render :xml => @post, :status => :created, :location => @post }
        # end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Dit indlæg blev opdateret!'
          #format.html { redirect_to(:action => 'index') }
          format.html { redirect_to(edit_post_path(@post)) }
                              format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # GET /posts
  # GET /posts.xml
  
  def blog
    @posts = Post.search(params[:search], params[:page])
    
    session[:single_blog] = nil
    session[:page] = params[:page]
    
    
    
    
    #@subposts = Post.find_all_by_parent_id(:order => 'created_at DESC')

    # respond_to do |format|
    #       format.html # index.html.erb
    #       format.xml  { render :xml => @posts }
    #     end
  end
  
  def miniblog
    if session[:sorter] == 10
      @posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => "created_at ASC")
    elsif session[:sorter] == 11
      @posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => "created_at DESC")
    elsif session[:sorter] == 20
      @posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => "author ASC")
    elsif session[:sorter] == 21
      @posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => "author DESC")
    else
      @posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => "created_at ASC")
    # elsif session[:sorter] == 30
    #       @posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => "comments ASC")
    #     elsif session[:sorter] == 31
    #       @posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => "comments DESC")
    end
    #@posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => 'created_at DESC')
    #@subposts = Post.find_all_by_parent_id(:order => 'created_at DESC')

    # respond_to do |format|
    #       format.html # index.html.erb
    #       format.xml  { render :xml => @posts }
    #     end
  end 
  

  def list_comments
    session[:post_id] = params[:id]
    session[:post_disclose] = params[:id]
    session[:post_close] = nil
    #@posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => 'created_at DESC')
    #@subposts = Post.find_all_by_parent_id(:order => 'created_at DESC')
    if session[:single_blog] == true
      redirect_to(:action => 'show', :id => session[:post_id])
      #redirect_to(:action => 'show_single_blog', :id => session[:post_id])
    else
      redirect_to(:action => 'list', :page => session[:page])
    end
  end
  
  
  def no_comments
    session[:post_id] = nil
    session[:post_close] = params[:id]
    session[:post_disclose] = nil
    #@posts = Post.find(:all, :conditions => ["parent_id IS NULL", true], :order => 'created_at DESC')
    #@subposts = Post.find_all_by_parent_id(:order => 'created_at DESC')
    if session[:single_blog] == true
      redirect_to(:action => 'show', :id => params[:id])
      #redirect_to(:action => 'show_single_blog', :id => params[:id])
    else
      redirect_to(:action => 'list', :page => session[:page])
    end
  end
  
  
  def new_comment
    @post = Post.find(params[:id])
    @post_id = params[:id]
    @post_title = @post.title
    @post = Post.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end


  # GET /posts/1
  # GET /posts/1.xml
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Dit indlæg blev slettet!'
     if session[:single_blog] == true
        session[:single_blog] = nil
     end
     
      respond_to do |format|
        #format.html { redirect_to(posts_url) }
        format.html { redirect_to(:action => 'index', :page => session[:page]) }
        format.xml  { head :ok }
      end
  end
  
  def sorter_dato
    if session[:sorter] == 11
      session[:sorter] = 10
    else
      session[:sorter] = 11
    end
    redirect_to (:action => 'mini_blog')
  end
  
  def sorter_forfatter
    if session[:sorter] == 21
      session[:sorter] = 20
    else
      session[:sorter] = 21
    end
    redirect_to (:action => 'mini_blog')
  end
  
  def sorter_kommentar
    if session[:sorter] == 31
      session[:sorter] = 30
    else
      session[:sorter] = 31
    end
    redirect_to (:action => 'mini_blog')
  end
  
end




