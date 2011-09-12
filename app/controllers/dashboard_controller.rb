class DashboardController < ApplicationController
  def index
    @farms = Farm.all
    @roasteries = Roastery.all
  end
end
