class Sample < ActiveRecord::Base
  default_scope :order => 'sample_number'
  
  belongs_to :cupping
  belongs_to :batch
  has_many :cupping_dry_fragrances, :dependent => :destroy
  has_many :cupping_crust_aromas, :dependent => :destroy
  has_many :cupping_break_aromas, :dependent => :destroy
  has_many :cupping_defects, :dependent => :destroy
  has_many :cupping_flavors, :dependent => :destroy
  has_many :cupping_after_tastes, :dependent => :destroy
  has_many :cupping_acidities, :dependent => :destroy
  has_many :cupping_mouthfeels, :dependent => :destroy
  has_many :cupping_balances, :dependent => :destroy
  has_many :cupping_sweetnesses, :dependent => :destroy
  has_many :cupping_uniformities, :dependent => :destroy
  has_many :cupping_clean_cups, :dependent => :destroy
  has_many :cupping_overalls, :dependent => :destroy
  has_many :cupping_total_scores, :dependent => :destroy
  
  
end
