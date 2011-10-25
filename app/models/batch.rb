class Batch < ActiveRecord::Base
  default_scope :order => 'roasted_on DESC'
  
  belongs_to :roast
  has_many :blends, :dependent => :destroy
  has_many :checks, :dependent => :destroy
  has_many :samples, :dependent => :destroy
  
  
  def batch_slelct
    "#{roasted_on.to_s(:long)} | #{roast.roastery.name} | #{roast.name} | Batch##{batch_number}"
  end
end
