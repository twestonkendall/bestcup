class Cupping < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  
  has_many :samples, :dependent => :destroy
  accepts_nested_attributes_for :samples, :reject_if => proc { |attributes| attributes['batch_id'].blank? && attributes['sample_number'].blank? }, :allow_destroy => true
end
