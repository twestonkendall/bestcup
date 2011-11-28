class ProducerAdmin < ActiveRecord::Base
  default_scope :order => 'farm_id DESC'

  belongs_to :user
  belongs_to :farm
  
  validates :user_id,   
            :presence => true,   
            :uniqueness => {:scope => :farm_id}
            
  def is_padmin? (user)
    not producer_admining_for(user).nil?
  end

  def producer_admining_for (user)
    farm.producer_admins.find_by_user_id(user)
  end
end
