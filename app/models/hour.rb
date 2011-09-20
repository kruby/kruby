class Hour < ActiveRecord::Base
  
  belongs_to :relation
  belongs_to :user
    
  scope :timeliste, lambda { |relation_id| where(:relation_id => relation_id) }
  
end
