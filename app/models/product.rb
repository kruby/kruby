class Product < ActiveRecord::Base
  belongs_to :category
  scope :active, :conditions => {:active => '1'}
  has_one :content, :as => :resource, :dependent => :destroy
  
  
  after_create :make_content
  after_update :update_content
  
   def make_content
     c = Content.new
     c.resource = self #fordi jeg bruger after_create kan jeg bruge self til at få id fra den aktuelle post
     #c.name = self.name
     #c.title = self.headline
     c.navlabel = self.name
     c.active = self.active
     #c.body = self.description
     #c.save
     c.controller_name = 'products'
     #c.controller_name = Content.find_by_resource_id(self.id).resource_type.pluralize.downcase
     #c.parent_id = Content.find_by_navlabel(c.controller_name).id
     c.save   
   end

   def update_content
     if
        c = Content.find_by_resource_id_and_resource_type(self.id, 'Product')
        #c = Content.find_by_resource_id(self.id) 
        #c.title = self.headline
        #c.body = self.description
        c.navlabel = self.name
        c.active = self.active
        c.save
    else
      c = Content.new
       c.resource = self #fordi jeg bruger after_create kan jeg bruge self til at få id fra den aktuelle post
       #c.name = self.name
       #c.title = self.headline
       c.navlabel = self.name
       c.active = self.active
       #c.body = self.description
       #c.save
       c.controller_name = 'products'
       #c.controller_name = Content.find_by_resource_id(self.id).resource_type.pluralize.downcase
       #c.parent_id = Content.find_by_navlabel(c.controller_name).id
       c.save
    end
   end

   
   
   
end
