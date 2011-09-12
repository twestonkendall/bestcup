class Farm < ActiveRecord::Base
  default_scope :order => 'name'
  
  has_many :beans, :dependent => :destroy
  
  COUNTRIES = ["Australia", "Bali", "Bolivia", "Brazil", "Burundi", "Celebes (Sulawesi)", "Colombia", "Congo", "Costa Rica", "Dominican Republic", "Ecuador", "El Salvador", "Ethiopia", "Flores", "Guatemala", "Hawaii", "Honduras", "India", "Jamaica", "Java", "Kenya", "Mexico", "Myanmar" "Nicaragua", "Panama", "Papua New Guinea", "Peru", "Puerto Rico", "Rwanda","St Helena", "Sumatra", "Tanzania", "Timor", "Uganda", "Zambia", "Zimbabwe", "", "Angola", "Benin", "Borneo", "Cameroon", "Central African Republic", "Cuba", "Gabon", "Ghana", "Guinea", "Haiti", "Ivory Coast", "Liberia", "Madagascar", "Malawi", "Nigeria", "Panama",  "Paraguay", "Philippines", "Sierra Leone", "Sri Lanka", "Thailand", "Togo", "Trinidad", "Tobago", "Venezuela", "Vietnam", "Yemen", "Zaire",]
  
end
