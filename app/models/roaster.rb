class Roaster < ActiveRecord::Base
  default_scope :order => 'roastery_id DESC'
  
  belongs_to :user
  belongs_to :roastery
  
  validates :user_id,   
            :presence => true,   
            :uniqueness => {:scope => :roastery_id}
  
end
