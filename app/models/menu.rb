# -*- encoding : utf-8 -*-
class Menu < ActiveRecord::Base
  
  has_one :content, :as => :resource, :dependent => :destroy
  
  after_create :make_content
  after_update :update_content
  
  def make_content
    c = Content.new
    c.resource = self #fordi jeg bruger after_create kan jeg bruge self til at få id fra den aktuelle post
    #c.name = self.name
    #c.title = self.title
    c.active = self.active
    c.navlabel = self.name
    #c.action_redirect = 'index'
    c.admin = true
    #c.redirect = true
    c.save
    #c.controller_redirect = self.name.downcase
    c.controller_name = 'menus'
    #c.parent_id = Content.find_by_name('Pages').first.id rescue nil
    #c.controller_name = Content.find_by_resource_id(self.id).resource_type.pluralize.downcase
    #c.parent_id = Content.find_by_navlabel('Pages').id rescue nil
    c.save
  end
  
  def update_content
    #c = Content.Page.find(self.id)
    c = Content.find_by_resource_id_and_resource_type(self.id, 'Menu')
    c.navlabel = self.name
    #c.name = self.name
    c.active = self.active
    #c.controller_redirect = self.title.to_s.downcase
    c.save
  end
  
  
end
