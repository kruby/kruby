# -*- encoding : utf-8 -*-
class Attachment < ActiveRecord::Base
  
  belongs_to :attachable, :polymorphic => true
  
  #attachable henviser til de 2 felter attachable_type og attachable_id der afgør via type hvilken model den tilhører og med id hvilket id det har i modellens tabel. (F.eks. post 11)
  
end
