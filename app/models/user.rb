class User < ActiveRecord::Base
  before_validation :downcase_email
  before_create { generate_token(:auth_token) }
  
  default_scope :order => 'username'
  
  attr_accessible :username, :email, :password, :password_confirmation, :admin, :roles
  has_secure_password
  validates :password, :presence => { :on => :create }
  validates :password_confirmation, :presence => true, :on => :create
  validates :username,   
              :presence => true,   
              :uniqueness => true
  validates :email,   
              :presence => true,   
              :uniqueness => true, 
              :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  
  
  has_many :roastery_admins, :dependent => :destroy
  has_many :roasters, :dependent => :destroy
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.hex
    end while User.exists?(column => self[column])
  end
  
  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end
  
  
end
