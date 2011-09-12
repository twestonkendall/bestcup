class Blend < ActiveRecord::Base
  default_scope :order => 'weight DESC' 
  
  belongs_to :bean
  belongs_to :roast
end
