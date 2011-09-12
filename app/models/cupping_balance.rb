class CuppingBalance < ActiveRecord::Base
  belongs_to :sample
  validates_presence_of :score
end
