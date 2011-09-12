class Bean < ActiveRecord::Base
  default_scope :order => 'variety'
  
  belongs_to :farm
  has_many :blends, :dependent => :destroy
  
  def bean_and_farm
    "#{variety}-#{farm.name}-#{farm.country}"
  end
  
  MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  VARIETALS = ["Arusha", "Bergendal, Sidikalang", "Blue Mountain", "Bourbon", "Kape Barako or Kape Baraco", "Caturra", "Catuai",	"Charrieriana",	"Colombian", "Ethiopian Harar", "Ethiopian Sidamo", "Ethiopian Yirgacheffe", "French Mission",	"Guadeloupe Bonifieur",	"Hawaiian Kona",	"Jamaican Blue Mountain", "Java", "K7", "Kape Alamid", "Kopi luwak", "Mayaguez", "Mocha", "Mundo Novo", "Orange, Yellow Bourbon", "Pacamara", "Pacas", "Pache Comum", "Pache Colis", "Panama", "Maragogipe", "Mundo Novo", "Ruiri", "S795", "Santos", "Sarchimor", "SL28", "SL34", "Sumatra Mandheling", "Sumatra Lintong", "Sulawesi Toraja Kalossi", "Timor", "Arabusta", "Typica", "Uganda"]
    
end
