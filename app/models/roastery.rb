class Roastery < ActiveRecord::Base
  default_scope :order => 'name'
  
  has_many :roasts , :dependent => :destroy
end
