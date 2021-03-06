class Check < ActiveRecord::Base
  default_scope :order => 'time DESC' 
  
  belongs_to :batch
  # validates_presence_of :gas_flow || :air_flow || :temp,
  # validates :gas_flow, :air_flow, :temp, :presence => true,
  #       :unless => Proc.new { |a| a.air_flow.present? || a.temp.present? || a.gas_flow.present? }  
  
  MILESTONES = [ "Temp/Flow", "Preheat", "1st crack", "2nd crack", "End"]
  GAS = ["0.00", "0.25", "0.50", "0.75", "1.00", "1.25", "1.50", "1.75", "2.00", "2.25", "2.50", "2.75", "3.00", "3.25", "3.50", "3.75", "4.00", "4.25", "4.50", "4.75", "5.00", "5.25", "5.50", "5.75", "6.00", "6.25", "6.50", "6.75", "7.00", "7.25", "7.50", "7.75", "8.00", "8.25", "8.50", "8.75", "9.00", "9.25", "9.50", "9.75", "10.00"]

  def is_roaster? (user)
    not allowed_to_roast(user).nil?
  end
  
  def allowed_to_roast (user)
    batch.roast.roastery.roasters.find_by_user_id(user)
  end
  
  def is_radmin? (user)
    not roastery_admining_for(user).nil?
  end

  def roastery_admining_for (user)
    batch.roast.roastery.roastery_admins.where(:verified => true).find_by_user_id(user)
  end
end
