class ProductsController < ApplicationController
  
  before_filter :current_controller #Findes i application_controller.rb
  before_filter :logged_in_as_admin?
  #before_filter :logged_in? #Findes i application_controller.rb
  #before_filter :login_required, :editor_required, :only => ['new', 'create', 'index']
  
  # GET /products
  # GET /products.xml
  
  def index
    @products = Product.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @page = Product.find(params[:id])
    
      @pagetitle = @page.title rescue 'Indhold følger snarest'
      @content = @page.description rescue 'Indhold følger snarest'
      @headline = @page.headline rescue 'Indhold følger snarest'
      if @page.image.length > 0 
         @image = @page.image
       else
         @image = 'forside.gif'
       end
       
       if @page.image_class.length > 0
         @image_class = @page.image_class
       else
         @image_class = 'foto_lille'
       end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end
  
  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Produktet blev oprettet'
        format.html { redirect_to(:action => "index") }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Produktet blev opdateret!'
        format.html { render :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Produktet blev slettet!'

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
