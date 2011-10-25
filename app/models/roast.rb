class Roast < ActiveRecord::Base
  default_scope :order => 'name DESC'
  
  belongs_to :roastery
  has_many :batches, :dependent => :destroy
  has_many :blends, :dependent => :destroy
  has_many :checks, :dependent => :destroy
  has_many :samples, :dependent => :destroy
  
  def roast_slelct
    "#{roastery.name}-#{name} | Batch##{batch_number} form #{roasted_on.to_s(:long)}"
  end
end