class RoasteryAdminsController < ApplicationController
  load_and_authorize_resource  

  def index
    @roastery_admins = RoasteryAdmin.where(:verified => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roastery_admins }
    end
  end

  def create
    @roastery_admin.verified = true
    @roastery = @roastery_admin.roastery
    respond_to do |format|
      if @roastery_admin.save
        format.html { redirect_to @roastery, :notice => 'Roastery admin was added.' }
        format.json { render :json => @roastery, :status => :created, :location => @roastery_admin }
      else
        format.html { redirect_to @roastery }
        format.json { render :json => @roastery_admin.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @roastery_admin.destroy
    @roastery = @roastery_admin.roastery
    respond_to do |format|
      format.html { redirect_to @roastery }
      format.json { head :ok }
    end
  end
end
