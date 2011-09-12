class CuppingAfterTaste < ActiveRecord::Base
  belongs_to :sample
  validates :score, :presence => {:unless => "notes"}
  validates :notes, :presence => {:unless => "score"}
end
