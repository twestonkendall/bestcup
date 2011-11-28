class RoastersController < ApplicationController
  load_and_authorize_resource

  def index
    @roasters = Roaster.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roasters }
    end
  end

  def create
    @roastery = @roaster.roastery
    respond_to do |format|
      if @roaster.save
        format.html { redirect_to @roastery, :notice => 'Roaster was successfully created.' }
        format.json { render :json => @roaster, :status => :created, :location => @roaster }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roaster.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @roaster.destroy
    @roastery = @roaster.roastery
    respond_to do |format|
      format.html { redirect_to @roastery }
      format.json { head :ok }
    end
  end
end
