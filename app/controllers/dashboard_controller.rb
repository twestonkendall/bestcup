class DashboardController < ApplicationController
  def index
    if current_user
    @user = current_user
    @cuppings = Cupping.where(:user_id => @user.id).take(5)
    @unverifyed = RoasteryAdmin.where(:user_id => @user.id)
    @radminFor = @unverifyed.where(:verified => true)
    @roasterFor = Roaster.where(:user_id => @user.id)
    @padminFor = ProducerAdmin.where(:user_id => @user.id)
    end
  end
end
