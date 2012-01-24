class Bean < ActiveRecord::Base
  before_validation :downcase_name

  extend FriendlyId
  friendly_id :farm_bean, :use => :history
  
  default_scope :order => 'variety'  
  belongs_to :farm
  has_many :blends, :dependent => :destroy
  validates :farm_id, :variety, :presence => true
  validates_uniqueness_of :variety, :scope => :farm_id
    
  def bean_and_farm
    "#{variety}-#{farm.name}-#{farm.country}"
  end
  
  def farm_bean
  	"#{farm.name}-#{variety}"
  end
  
  def is_padmin? (user)
    not producer_admining_for(user).nil?
  end
  
  def producer_admining_for (user)
    farm.producer_admins.find_by_user_id(user)
  end
  
  MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  VARIETALS = ["Arabica", "Arusha", "Bergendal, Sidikalang", "Blue Mountain", "Bourbon", "Caturra", "Catuai",	"Charrieriana",	"Colombian", "Ethiopian Harar", "Ethiopian Sidamo", "Ethiopian Yirgacheffe", "French Mission",	"Guadeloupe Bonifieur",	"Hawaiian Kona", "Heirloom",	"Jamaican Blue Mountain", "Java", "K7", "Kape Alamid", "Kape Barako", "Kopi luwak", "Mayaguez", "Mocha", "Mundo Novo", "Orange, Yellow Bourbon", "Pacamara", "Pacas", "Pache Comum", "Pache Colis", "Panama", "Maragogipe", "Mundo Novo","Robusta", "Ruiri", "S795", "Santos", "Sarchimor", "SL28", "SL34", "Sumatra Mandheling", "Sumatra Lintong", "Sulawesi Toraja Kalossi", "Timor", "Arabusta", "Typica", "Uganda"]
   
 private

 def downcase_name
 	self.variety = self.variety.downcase if self.variety.present?
 end 
end
