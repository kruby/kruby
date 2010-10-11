class Content < ActiveRecord::Base
   
  acts_as_tree :order => "position"
  
  #named_scope :parent_pages, :conditions => ["parent_id IS NULL and active", true], :order => 'position'
  
  named_scope :admin_pages, :conditions => ["parent_id IS NULL and active", true], :order => 'position'
  named_scope :editor_pages, :conditions => ["parent_id IS NULL and active and category = 'editor' or category = 'public' or category = 'user' ", true], :order => 'position'
  named_scope :user_pages, :conditions => ["parent_id IS NULL and active and category = 'user' or category = 'public' ", true], :order => 'position'
  
  #named_scope :subpages, :conditions => ["parent_id and active", true], :order => 'position, position2'
  #ovenfor finder vil alle parent-siderne, hvor nogle af dem har children
  
  named_scope :public_pages, :conditions => ["(parent_id IS NULL and active and admin != ?) or (parent_id IS NULL and active and admin IS NULL)", true], :order => 'position'
  #public_pages finder alle aktive sider der ikke er admin sider
  
  named_scope :main_menu, :conditions => ["controller_name = 'pages' and active and admin != ?", true], :order => 'position'
  
  named_scope :pages, :conditions => {:controller_name => 'pages'}, :order => 'position'
  named_scope :not_admin, :conditions => { :admin => false }, :order => 'position'
  named_scope :active, :conditions => {:active => true }, :order => 'position'
  
  belongs_to :resource, :polymorphic => true
  # resource ovenfor er bare et navn. Det kunne have været hvadsomhelst, men i tabellen contents hedder de 2 vigtigste feltnavne så: resource_id og resource_type
end

#GAMMELT
#named_scope :main_pages, :conditions => ["parent_id IS NULL and active", true], :order => 'position'
#named_scope :public_pages, :conditions => ["parent_id IS NULL and admin != ?", true], :order => 'position'