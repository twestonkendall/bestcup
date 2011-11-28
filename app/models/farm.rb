class Farm < ActiveRecord::Base
  default_scope :order => 'name'
  
  has_many :beans, :dependent => :destroy
  has_many :producer_admins, :dependent => :destroy
  
  validates :name, :country, :presence => true
  
  validates_uniqueness_of :name, :scope => :country, :case_sensitive => false
  
  def is_padmin? (user)
    not producer_admining_for(user).nil?
  end
  
  def producer_admining_for (user)
    producer_admins.find_by_user_id(user)
  end
  
  def name_and_country
    "#{name.titleize} from #{country}"
  end
  
  COUNTRIES = ["Australia", "Bali", "Bolivia", "Brazil", "Burundi", "Celebes (Sulawesi)", "Colombia", "Congo", "Costa Rica", "Dominican Republic", "Ecuador", "El Salvador", "Ethiopia", "Flores", "Guatemala", "Hawaii", "Honduras", "India", "Jamaica", "Java", "Kenya", "Mexico", "Myanmar" "Nicaragua", "Panama", "Papua New Guinea", "Peru", "Puerto Rico", "Rwanda","St Helena", "Sumatra", "Tanzania", "Timor", "Uganda", "Zambia", "Zimbabwe", "", "Angola", "Benin", "Borneo", "Cameroon", "Central African Republic", "Cuba", "Gabon", "Ghana", "Guinea", "Haiti", "Ivory Coast", "Liberia", "Madagascar", "Malawi", "Nigeria", "Panama",  "Paraguay", "Philippines", "Sierra Leone", "Sri Lanka", "Thailand", "Togo", "Trinidad", "Tobago", "Venezuela", "Vietnam", "Yemen", "Zaire",]
  
end
