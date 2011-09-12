class Cupping < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  
  has_many :samples, :dependent => :destroy
  accepts_nested_attributes_for :samples, :reject_if => :all_blank, :allow_destroy => true
end