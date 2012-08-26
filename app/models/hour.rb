class Hour < ActiveRecord::Base
  
  belongs_to :relation
  belongs_to :user
  
  #scope :today, lambda { WHERE("created_at BETWEEN '#{DateTime.now.beginning_of_day}' AND '#{DateTime.now.end_of_day}'") }
    
  scope :timeliste, lambda { |relation_id| where(:relation_id => relation_id) }
  
  scope :customer, lambda { |relation_id| where(:relation_id => relation_id) }
  
  scope :month_hours, lambda { |this_month| where("date BETWEEN '#{this_month.to_datetime.beginning_of_month}' AND '#{this_month.to_datetime.end_of_month}'") }
  
  scope :year_hours, lambda { |this_year| where("date BETWEEN '#{this_year.to_datetime.beginning_of_year}' AND '#{this_year.to_datetime.end_of_year}'") }
  
  scope :last_year_first_6_months, lambda { |this_date| where("date BETWEEN '#{this_date.to_datetime.beginning_of_year}' AND '#{this_date.to_datetime.beginning_of_year+6.months-1.day}'") }
  scope :last_year_last_6_months, lambda { |this_date| where("date BETWEEN '#{this_date.to_datetime.beginning_of_year+6.months}' AND '#{this_date.to_datetime.end_of_year}'") }
  
  scope :this_year_last_6_months, lambda { |this_date| where("date BETWEEN '#{this_date.to_datetime.beginning_of_year+6.months}' AND '#{this_date.to_datetime.end_of_year}'") }
  scope :this_year_first_6_months, lambda { |this_date| where("date BETWEEN '#{this_date.to_datetime.beginning_of_year}' AND '#{this_date.to_datetime.beginning_of_year+6.months-1.day}'") }
  
  #scope :customer_hours, lambda { |relation_id, this_month| where(:relation_id => relation_id) and where("date BETWEEN '#{this_month.to_datetime.beginning_of_month}' AND '#{this_month.to_datetime.end_of_month}'")  }
end
