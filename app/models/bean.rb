class Bean < ActiveRecord::Base
  default_scope :order => 'variety'  
  belongs_to :farm
  has_many :blends, :dependent => :destroy
  validates :farm_id, :variety, :presence => true
  validates_uniqueness_of :variety, :scope => :farm_id
    
  def bean_and_farm
    "#{variety}-#{farm.name}-#{farm.country}"
  end
  def is_padmin? (user)
    not producer_admining_for(user).nil?
  end
  
  def producer_admining_for (user)
    farm.producer_admins.find_by_user_id(user)
  end
  
  MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  VARIETALS = ["Arusha", "Bergendal, Sidikalang", "Blue Mountain", "Bourbon", "Kape Barako or Kape Baraco", "Caturra", "Catuai",	"Charrieriana",	"Colombian", "Ethiopian Harar", "Ethiopian Sidamo", "Ethiopian Yirgacheffe", "French Mission",	"Guadeloupe Bonifieur",	"Hawaiian Kona",	"Jamaican Blue Mountain", "Java", "K7", "Kape Alamid", "Kopi luwak", "Mayaguez", "Mocha", "Mundo Novo", "Orange, Yellow Bourbon", "Pacamara", "Pacas", "Pache Comum", "Pache Colis", "Panama", "Maragogipe", "Mundo Novo", "Ruiri", "S795", "Santos", "Sarchimor", "SL28", "SL34", "Sumatra Mandheling", "Sumatra Lintong", "Sulawesi Toraja Kalossi", "Timor", "Arabusta", "Typica", "Uganda"]
    
end
