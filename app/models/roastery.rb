class Roastery < ActiveRecord::Base
  default_scope :order => 'name'
  
  has_many :roasts , :dependent => :destroy
  has_many :roastery_admins, :dependent => :destroy
  has_many :roasters, :dependent => :destroy
  
end
