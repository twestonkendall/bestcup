class DashboardController < ApplicationController
  def index
    if current_user
    @user = current_user
    @cuppings = Cupping.where(:user_id => @user.id)
    # show all roasts where current user is a verifyed roastery admin
    @unverifyed = RoasteryAdmin.where(:user_id => @user.id)
    @adminFor = @unverifyed.where(:verified => true)
    @roasterFor = Roaster.where(:user_id => @user.id)
    
  end
  end
end
