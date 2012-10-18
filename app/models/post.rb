# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  
  has_many :attachments, :as => :attachable
  
  # attr_accessor :x1, :y1, :width, :height

  # has_attached_file   :photo, :styles => { :original => "500x500>", :small => "100x100>", :medium => "200x200>", :large => "300x300>", :thumb => "20x20>" },
  #                       :url => "/uploads/posts/:id/:style/:basename.:extension",
  #                       :path => ":rails_root/public/uploads/posts/:id/:style/:basename.:extension"
  #   
  has_many :subpages, :class_name => 'Post', :foreign_key => 'parent_id', :dependent => :destroy
  #  belongs_to :parent, :class_name => 'Post', :foreign_key => 'parent_id'
    
  acts_as_tree :order => 'created_at DESC'
  
  scope :forside_blogs, :order => 'created_at DESC'
  scope :forside_blogs_active, :conditions => ["active", true], :order => 'created_at DESC'
  
  scope :admin_pages, :conditions => ["parent_id IS NULL and active", true], :order => 'position'
  
  
  def self.search(search, page)
    paginate  :per_page => 10, :page => page,
              :conditions => ['parent_id is NULL'],
              #:conditions => "active = 1 and name like '%#{search}%'", #De 2 nedenfor sammenskrevet til 1 linie og med AND
              #:conditions => ['active = ?', 1],
              #:conditions => ['name like ?', "%#{search}%"],
              :order => 'created_at DESC'
  end
  
end
