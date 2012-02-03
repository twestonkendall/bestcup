class User < ActiveRecord::Base
  before_validation :downcase_email
  default_scope :order => 'email'
  
  attr_accessible :username, :email, :password, :password_confirmation, :admin, :roles
  has_secure_password
  validates :password, :presence => { :on => :create }
  validates :password_confirmation, :presence => true, :on => :create
  validates :email,   
              :presence => true,   
              :uniqueness => true, 
              :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  
  
  has_many :roastery_admins, :dependent => :destroy
  has_many :roasters, :dependent => :destroy
  
  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end
  
end
