class Relation < ActiveRecord::Base
  
  belongs_to :user
  
  def self.search(search, page)
    paginate  :per_page => 10, :page => page,
              #:conditions => "active = 1 and name like '%#{search}%'", #De 2 nedenfor sammenskrevet til 1 linie og med AND
              #:conditions => ['active = ?', 1],
              :conditions => ['company like ?', "%#{search}%"],
              #:conditions => ['city like ?', "%#{search}%"],
              :order => 'company'
  end
  
  has_many :hours
  has_many :vouchers
  
end
