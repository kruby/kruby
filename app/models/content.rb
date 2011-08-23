class Content < ActiveRecord::Base
   
  acts_as_tree :order => "position"
  
  scope :admin_pages, :conditions => ["parent_id IS NULL and active and category = 'admin'", true], :order => 'position'
  scope :editor_pages, :conditions => ["parent_id IS NULL and active and category = 'editor'", true], :order => 'position'
  scope :user_pages, :conditions => ["parent_id IS NULL and active and category = 'user'", true], :order => 'position'
  scope :public_pages, :conditions => ["parent_id IS NULL and active and category = 'public' ", true], :order => 'position'
    
  scope :main_menu, :conditions => ["parent_id IS NULL and active and category = 'public' ", true], :order => 'position, created_at'
  
  scope :pages, :conditions => {:controller_name => 'pages'}, :order => 'position'
  
  scope :active, :conditions => {:active => true }, :order => 'position'
  
  belongs_to :resource, :polymorphic => true
  
  # resource ovenfor er bare et navn. Det kunne have været hvadsomhelst, men i tabellen contents hedder de 2 vigtigste feltnavne så: resource_id og resource_type
end
