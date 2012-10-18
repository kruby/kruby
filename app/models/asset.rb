# -*- encoding : utf-8 -*-
class Asset < ActiveRecord::Base
  
  has_attached_file   :photo, :styles => { :original => "500x500>", :small => "100x100>", :medium => "200x200>", :large => "300x300>", :thumb => "20x20>" },
                       :url => "/uploads/assets/:id/:style/:basename.:extension",
                       :path => ":rails_root/public/uploads/assets/:id/:style/:basename.:extension"
                       
 belongs_to :attachment, :polymorphic => true
  

end
