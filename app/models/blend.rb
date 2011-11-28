class Blend < ActiveRecord::Base
  default_scope :order => 'weight DESC' 
  
  belongs_to :bean
  belongs_to :batch
  
  validates :bean_id, :presence => true
            
  def is_roaster? (user)
    not allowed_to_roast(user).nil?
  end
  
  def allowed_to_roast (user)
    batch.roast.roastery.roasters.find_by_user_id(user)
  end

  def is_radmin? (user)
    not roastery_admining_for(user).nil?
  end

  def roastery_admining_for (user)
    batch.roast.roastery.roastery_admins.where(:verified => true).find_by_user_id(user)
  end
end
