class Roast < ActiveRecord::Base
  default_scope :order => 'name DESC'
  
  validates :name,   
            :presence => true,   
            :uniqueness => { :case_sensitive => false }
  
  belongs_to :roastery
  has_many :batches, :dependent => :destroy
  has_many :blends
  has_many :checks
  has_many :samples
  
  def roast_slelct
    "#{roastery.name}-#{name} | Batch##{batch_number} form #{roasted_on.to_s(:long)}"
  end
  
  def is_radmin? (user)
    not roastery_admining_for(user).nil?
  end
  
  def roastery_admining_for (user)
    roastery.roastery_admins.where(:verified => true).find_by_user_id(user)
  end
end