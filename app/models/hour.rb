class Hour < ActiveRecord::Base
  
  belongs_to :relation
    
  scope :timeliste, lambda { |relation_id| where(:relation_id => relation_id) }
  
end
