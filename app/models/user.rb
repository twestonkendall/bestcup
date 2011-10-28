class User < ActiveRecord::Base
  default_scope :order => 'email'
  
  attr_accessible :email, :password, :password_confirmation, :admin, :roles
  has_secure_password
  
  validates_presence_of :password, :on => :create
  validates :email,   
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  
  
  has_many :roastery_admins, :dependent => :destroy
  has_many :roasters, :dependent => :destroy
  
  ROLES = %w[roaster barista] #make sure to add additinal roles to the end of the array so that is dosent mess up the rest

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
end
