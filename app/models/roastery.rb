class Roastery < ActiveRecord::Base
  before_validation :downcase_name
  
  extend FriendlyId
  friendly_id :name, :use => :history
  
  
  default_scope :order => 'name'
  validates :name,   
            :presence => true,   
            :uniqueness => { :case_sensitive => false }
            
  validates_format_of :website,
                      :allow_blank => true,
                      :with => URI::regexp, 
                      :message => "must start with http://", 
                      :on => :update
  
  has_many :roasts , :dependent => :destroy
  has_many :roastery_admins, :dependent => :destroy
  has_many :roasters, :dependent => :destroy
  has_many :batches, :through => :roasts
  
  def is_roaster? (user)
    not allowed_to_roast(user).nil?
  end
  
  def allowed_to_roast (user)
    roasters.find_by_user_id(user)
  end
  
  def is_radmin? (user)
    not roastery_admining_for(user).nil?
  end
  
  def roastery_admining_for (user)
    roastery_admins.where(:verified => true).find_by_user_id(user)
  end
  
  def get_host_without_www(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end

  private

  def downcase_name
    self.name = self.name.downcase if self.name.present?
  end
end

