class Batch < ActiveRecord::Base
  default_scope :order => 'roasted_on DESC'
  
  belongs_to :roast
  has_many :blends, :dependent => :destroy
  has_many :checks, :dependent => :destroy
  has_many :samples, :dependent => :destroy

  def batch_slelct
    "#{roasted_on.to_s(:long)} | #{roast.roastery.name} | #{roast.name} | Batch##{batch_number}"
  end
  
  def roast_from_roastery
    "#{roast.name.titleize} by #{roast.roastery.name.titleize}"
  end
  def is_roaster? (user)
    not allowed_to_roast(user).nil?
  end
  
  def allowed_to_roast (user)
    roast.roastery.roasters.find_by_user_id(user)
  end
  
  def is_radmin? (user)
    not roastery_admining_for(user).nil?
  end

  def roastery_admining_for (user)
    roast.roastery.roastery_admins.where(:verified => true).find_by_user_id(user)
  end
end