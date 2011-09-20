class User < ActiveRecord::Base
  
  #has_one :relation
  belongs_to :relation
  
  #after_save :make_user_id_in_relation
  
  attr_accessible :email, :password, :password_confirmation, :blogname, :name, :category, :active, :relation_id
    
  scope :admin, where("category = ?", "Admin")
  scope :editor, where("category = ?", 'Editor')
  scope :user, where("category = ?", 'User')
  scope :with_relation_id, where('relation_id IS NOT NULL')
  
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :blogname
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end

