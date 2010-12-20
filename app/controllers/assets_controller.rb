class AssetsController < ApplicationController
  
  before_filter :login_required, :user_required
  
  # GET /assets
  # GET /assets.xml
  def index
    @assets = Asset.find(:all, :order => 'photo_updated_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assets }
    end
  end
  
  def add_to_post
    @assets = Asset.find(:all, :order => 'photo_updated_at DESC')
    @attachable = Post.find(params[:id])
    @array_of_ids = find_attachment_ids(@attachable)
      

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assets }
    end
  end

  # GET /assets/1
  # GET /assets/1.xml
  def show
    @asset = Asset.find(params[:id])
    render :layout => 'asset_only'
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @asset }
    # end
  end

  # GET /assets/new
  # GET /assets/new.xml
  def new
    @asset = Asset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    @asset = Asset.find(params[:id])
  end

  # POST /assets
  # POST /assets.xml
  def create
    @asset = Asset.new(params[:asset])

    respond_to do |format|
      if @asset.save
        flash[:notice] = 'Upload lykkedes.'
        format.html { redirect_to(:action => 'index') }
        format.xml  { render :xml => @asset, :status => :created, :location => @asset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assets/1
  # PUT /assets/1.xml
  def update
    @asset = Asset.find(params[:id])

    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        flash[:notice] = 'Asset was successfully updated.'
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.xml
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    respond_to do |format|
      format.html { redirect_to(assets_url) }
      format.xml  { head :ok }
    end
  end

  def edit_multiple
    @asset_ids = params[:asset_ids]
    @post = Post.find(params[:post_id])
    
    if @asset_ids
      @assets = Asset.find(@asset_ids)
      @assets.each do |asset|
        @post.attachments.build(:attachable_id => @post.id, :asset_id => asset.id, :attachable_type => 'Post')
      end
      @post.save!
      redirect_to edit_post_path(@post)
    else
      redirect_to add_to_post_path(@post)
      flash[:notice] = 'Du skal tilføje fotos eller gå tilbage!'
      
    end  
  end

  def update_multiple
    @assets = Product.find(params[:product_ids])
    @products.each do |product|
      product.update_attributes!(params[:product].reject { |k,v| v.blank? })
    end
    flash[:notice] = "Updated products!"
    redirect_to products_path
  end
  
  def find_attachment_ids(attachable)
    @attachment_ids = Attachment.find_all_by_attachable_id(attachable.id, :select => :asset_id)
    @array_of_ids = []
    @c = 0
    @attachment_ids.each do
      @array_of_ids << @attachment_ids[@c][:asset_id]
      @c += 1
    end
    return @array_of_ids
  end

end