# -*- encoding : utf-8 -*-
class Newsarchive < ActiveRecord::Base
  scope :author, :conditions => {:author => 'TKS'}
  scope :active, :conditions => {:active => '1'}, :order => 'updated_at DESC'
  has_one :content, :as => :resource, :dependent => :destroy
  #Den her sletter tilsvarende post i content når den slettes i newsarchives
  # scope :latest, :condition => {:updated_at => ?}
  
  
  # after_create :make_content
  #   after_update :update_content

   def make_content
     c = Content.new
     c.resource = self #fordi jeg bruger after_create kan jeg bruge self til at få id fra den aktuelle post
     #c.name = self.name
     #c.title = self.title
     #c.body = self.text
     c.navlabel = self.name
     c.active = self.active
     #c.save
     c.controller_name = 'newsarchives'
     #c.controller_name = Content.find_by_resource_id(self.id).resource_type.pluralize.downcase
     #c.parent_id = Content.find_by_navlabel(c.controller_name).id
     c.save   
   end

   def update_content
    c = Content.find_by_resource_id_and_resource_type(self.id, 'Newsarchive')
    #c = Content.find_by_resource_id(self.id) 
    #c.name = self.title
    #c.body = self.text
    c.navlabel = self.name
    c.active = self.active
    c.save
   end
   
end
