# -*- encoding : utf-8 -*-
class Voucher < ActiveRecord::Base
  
  belongs_to :relation
  
  scope :last_year_first_6_months, lambda { |this_date| where("date BETWEEN '#{this_date.to_datetime.beginning_of_year}' AND '#{this_date.to_datetime.beginning_of_year+6.months-1.day}'") }
  scope :last_year_last_6_months, lambda { |this_date| where("date BETWEEN '#{this_date.to_datetime.beginning_of_year+6.months}' AND '#{this_date.to_datetime.end_of_year}'") }
  
  scope :this_year_last_6_months, lambda { |this_date| where("date BETWEEN '#{this_date.to_datetime.beginning_of_year+6.months}' AND '#{this_date.to_datetime.end_of_year}'") }
  scope :this_year_first_6_months, lambda { |this_date| where("date BETWEEN '#{this_date.to_datetime.beginning_of_year}' AND '#{this_date.to_datetime.beginning_of_year+6.months-1.day}'") }    
  
  #scope :this_half_year(which_half_of_year(this_date))
  
  # def self.which_half_of_year(this_date)
  #     if this_date.to_date.month > 6
  #        Voucher.these_last_6_months(this_date)
  #       else
  #        Voucher.these_first_6_months(this_date)
  #     end
  #   end
  
end
