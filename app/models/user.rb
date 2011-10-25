class User < ActiveRecord::Base
  default_scope :order => 'email'
  
  attr_accessible :email, :password, :password_confirmation, :admin
  has_secure_password
  validates_presence_of :password, :on => :create
  validates :email,   
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  has_many :roastery_admins, :dependent => :destroy
  has_many :roasters, :dependent => :destroy
end
