class Roaster < ActiveRecord::Base
  default_scope :order => 'roastery_id DESC'
  
  belongs_to :user
  belongs_to :roastery
  
  validates :user_id,   
            :presence => true,   
            :uniqueness => {:scope => :roastery_id}
  def is_radmin? (user)
    not roastery_admining_for(user).nil?
  end

  def roastery_admining_for (user)
    roastery.roastery_admins.where(:verified => true).find_by_user_id(user)
  end  
end
