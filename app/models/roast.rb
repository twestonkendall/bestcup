class Roast < ActiveRecord::Base
  default_scope :order => 'roasted_on DESC'
  
  belongs_to :roastery
  has_many :blends, :dependent => :destroy
  has_many :checks
  has_many :samples
  
  def roast_slelct
    "#{roastery.name}-#{name} | Batch##{batch_number} form #{roasted_on.to_s(:long)}"
  end
end