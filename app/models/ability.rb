class Ability
  
  include CanCan::Ability

  def initialize(user)
  # guest
    can :read, [Farm, Roastery]
    can :create, User
  # General user
    if user
      can :manage, User, :id => user.id
      can :read, [Roast, Bean, Cupping]
      can :create, [Farm, Bean, Roastery, Roast, Cupping, Batch,Check, Blend] 
      can :update, [Cupping], :user_id => user.id
      can :destroy, [Cupping], :user_id => user.id
      can :manage, [CuppingTotalScore, CuppingOverall, CuppingCleanCup, CuppingUniformity, CuppingSweetness, CuppingBalance, CuppingMouthfeel, CuppingAcidity, CuppingAfterTaste, CuppingFlavor, CuppingDefect, CuppingBreakAroma, CuppingCrustAroma, CuppingDryFragrance]
  # Site Admin
      if user.admin?
        can :manage, :all
      end
  # Roaster
    # Roaster
      can :destroy, [Roaster], :user_id => user.id
    # Batch
      can :read, Batch do |batch|
        batch.is_roaster?(user)
      end
      can :update, Batch do |batch|
        batch.is_roaster?(user)
      end
      can :destroy, Batch do |batch|
        batch.is_roaster?(user)
      end
    # Blend
      can :read, Blend do |blend|
        blend.is_roaster?(user)
      end
      can :update, Blend do |blend|
        blend.is_roaster?(user)
      end
      can :destroy, Blend do |blend|
        blend.is_roaster?(user)
      end
    # Check
      can :read, Check do |check|
        check.is_roaster?(user)
      end
      can :update, Check do |check|
        check.is_roaster?(user)
      end
      can :destroy, Check do |check|
        check.is_roaster?(user)
      end
      
  # Roastery Admin
    # Roastery Admin
      can :manage, RoasteryAdmin do |radmin|
        radmin.is_radmin?(user)
      end
    # Roaster
      can :manage, Roaster do |roaster|
        roaster.is_radmin?(user)
      end
    # Batch
      can :read, Batch do |batch|
        batch.is_radmin?(user)
      end
      can :update, Batch do |batch|
        batch.is_radmin?(user)
      end
      can :destroy, Batch do |batch|
        batch.is_radmin?(user)
      end
    # Blend
      can :read, Blend do |blend|
        blend.is_radmin?(user)
      end
      can :update, Blend do |blend|
        blend.is_radmin?(user)
      end
      can :destroy, Blend do |blend|
        blend.is_radmin?(user)
      end
    # Check
      can :read, Check do |check|
        check.is_radmin?(user)
      end
      can :update, Check do |check|
        check.is_radmin?(user)
      end
      can :destroy, Check do |check|
        check.is_radmin?(user)
      end
    # Roastery
      can :update, Roastery do |roastery|
        roastery.is_radmin?(user)
      end
      can :destroy, Roastery do |roastery|
        roastery.is_radmin?(user)
      end
    # roast
      can :update, Roast do |roast|
        roast.is_radmin?(user)
      end
      can :destroy, Roast do |roast|
        roast.is_radmin?(user)
      end
      
  # Producer Admin
    # Producer Admin
      can :manage, ProducerAdmin do |padmin|
        padmin.is_padmin?(user)
      end
    # Farm
      can :update, Farm do |farm|
        farm.is_padmin?(user)
      end
    # Bean
      can :update, Bean do |bean|
        bean.is_padmin?(user)
      end
      can :destroy, Bean do |bean|
        bean.is_padmin?(user)
      end
    end
  end
end

# Bean, Roast, Batch, Blend, Check

# Roaster, RoasteryAdmin

# Cupping, Sample, Cupping_total_scores, Cupping_overall, Cupping_clean_cup, Cupping_uniformity, Cupping_sweetness, Cupping_balance, Cupping_mouthfeel, Cupping_acidity, Cupping_after_taste, Cupping_flavor, Cupping_defect, Cupping_break_aroma, Cupping_crust_aroma, Cupping_dry_fragrance



# Farm, Roastery, User