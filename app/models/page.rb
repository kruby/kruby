class Page < ActiveRecord::Base
  #has_many :subpages, :class_name => 'Page', :foreign_key => 'parent_id'
  #belongs_to :parent, :class_name => 'Page', :foreign_key => 'parent_id'
  has_one :content, :as => :resource, :dependent => :destroy
  
  after_create :make_content
  after_update :update_content
  
  def make_content
    c = Content.new
    c.resource = self #fordi jeg bruger after_create kan jeg bruge self til at få id fra den aktuelle post
    #c.name = self.name
    #c.title = self.title
    c.navlabel = self.name.capitalize #opretter navlabel første gang men opdatere ikke fra titel igen
    #c.body = self.body
    c.active = self.active
    #c.save
    c.controller_name = 'pages'
    #c.controller_name = Content.find_by_resource_id(self.id).resource_type.pluralize.downcase
    #c.parent_id = Content.find_by_navlabel(c.controller_name).id
    c.save   
  end
  
  def update_content
    if 
      c = Content.find_by_resource_id_and_resource_type(self.id, 'Page')
     #c = Content.find_by_resource_id(self.id)
     #c.name = self.name
     c.navlabel = self.name
     c.active = self.active
     #c.title = self.title
     #c.body = self.body
     c.save
   else
     c = Content.new
     c.resource = self #fordi jeg bruger after_create kan jeg bruge self til at få id fra den aktuelle post
     #c.name = self.name
     #c.title = self.title
     c.navlabel = self.name.capitalize #opretter navlabel første gang men opdatere ikke fra titel igen
     #c.body = self.body
     c.active = self.active
     #c.save
     c.controller_name = 'pages'
     #c.controller_name = Content.find_by_resource_id(self.id).resource_type.pluralize.downcase
     #c.parent_id = Content.find_by_navlabel(c.controller_name).id
     c.save
   end
  end
  
end
# ["active = '1' and position2 = ?", true],
#scope :main_pages, :conditions => ["parent_id IS NULL and active", true], :order => 'position, position2'
#scope :public_pages, :conditions => ["parent_id IS NULL and admin != ?", true], :order => 'position'
#scope :subpages, :conditions => ["active and position2", true], :order => 'position, position2'
# scope :submenu, :conditions => {:parent_id => '4'}, :order => 'position'

# scope :undermenu, :conditions => {:active => '1', :parent_id}, :order => 'position'
# scope :active, :conditions => {:active => '1'}, :order => 'position DESC' (vil give omvendt rækkefølge)
